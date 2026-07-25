## Context

The app is a single Rails 8 monolith (Postgres, ActiveAdmin, Devise, Haml views, Stimulus/Turbo, esbuild + dart-sass for assets via `jsbundling-rails`/`cssbundling-rails`, deployed to Heroku per `app.json`/`Procfile`). It's had several rapid feature-removal passes recently (SoundCloud, music videos, social links, ytr/bandcamp) done by cherry-picking out controllers/views/models but not always their DB tables, admin resources, or JS. Separately, the `rails` gem was bumped to 8.0.2.1 at some point but `config.load_defaults` in `config/application.rb` was left at `7.0`, so the app is running three major versions of framework defaults behind the gem it's actually loading. There is one developer; no CI gate currently blocks a broken deploy other than manual testing.

Current confirmed dead/orphaned code (from direct inspection, not guesswork):
- `mixes`, `mix_reviews`, `mix_embeds` tables in `db/schema.rb` with no models or controllers referencing them.
- `MixVote`/`mix_votes_controller.rb`/`app/views/mixes/**`/`app/views/mix_votes/**`: not in `config/routes.rb` at all; controller uses hardcoded placeholder data (`# Placeholder: 12 songs... replace with real data later`).
- `app/admin/mix.rb`: empty file (0 bytes).
- `app/javascript/controllers/ratio_controller.js`: registered in the Stimulus manifest but no view references `data-controller="ratio"` (its `useWindowResize`/`embedTarget` logic was built for the now-removed video embeds).
- `three`, `three-css2drender` in `package.json`: no references anywhere under `app/javascript`.
- `esbuild.config.js` at repo root: not invoked by anything — `package.json`'s `build` script calls the `esbuild` CLI directly with different args.
- `index.ts`, `tsconfig.json`, `bun.lockb` at repo root: an untracked (not in `git ls-files`) Bun scaffold (`console.log("Hello via Bun!")`) unrelated to the real yarn/esbuild pipeline.
- No `listen` gem in the Gemfile, so Rails' dev file watcher falls back to `ActiveSupport::FileUpdateChecker` (stat-polling) instead of `ActiveSupport::EventedFileUpdateChecker` — a likely contributor to sluggish reload, on top of `bin/dev` running three separate watched processes (Rails server, `esbuild --watch`, `sass --watch`) via foreman and a 173MB `tmp/cache/bootsnap` that may be stale.

## Goals / Non-Goals

**Goals:**
- Bring gems and npm packages to current stable versions without changing observable site behavior.
- Adopt Rails 8.1 framework defaults deliberately, verifying each default's behavior change against this app.
- Make local dev reload (code change → server picks it up; JS/CSS change → browser reflects it) noticeably faster.
- Delete confirmed-dead code (DB tables, controllers, views, admin resources, JS, stray config files) rather than leaving it commented out or "just in case."

**Non-Goals:**
- No new features or UI changes.
- No infrastructure changes (still Heroku, still Postgres, still ActiveAdmin) — this is a tune-up, not a rewrite.
- Not chasing every gem to its latest major if it forces an unrelated rewrite (e.g., Devise 5 is a major bump — evaluate but don't force it if it's high-risk for low reward; note it as a follow-up if deferred).

## Decisions

- **Ruby 3.3.0 → 3.4.x is now a required step, not optional polish.** Discovered while bumping the `rails` gem: Rails 8.1.3's `ActionView::Helpers::CaptureHelper#capture` uses `def capture(*, **, &block); ...; yield(*, **); ...; end` — forwarding anonymous rest/kwrest params from an enclosing method into a nested block. Ruby 3.3.0 raises a hard `SyntaxError` on this at parse time (reproduced in isolation, not an app-specific issue); the restriction is lifted in Ruby 3.4. The `railties` gemspec's `required_ruby_version >= 3.2.0` does not actually guarantee the app boots on 3.2 or 3.3. Given a choice between staying on Rails 8.0.2.1 or upgrading Ruby, the user chose to upgrade Ruby to unlock Rails 8.1.
- **Upgrade order: Ruby version first, then Ruby gems, then framework defaults, then npm packages, then dead-code removal, then hot-reload fixes.** Rationale: gem/framework changes are the highest-risk, most-test-covered layer — do them first while the safety net (specs) still reflects current behavior, and re-run specs after each stage rather than batching all changes into one diff. Dead code removal and dev-tooling fixes are lower risk and easier to bisect if done last, in small commits.
- **Framework defaults: bump one minor Rails version's worth of defaults at a time (7.0 → 7.1 → 7.2 → 8.0 → 8.1), not straight to 8.1.** Rationale: `config.load_defaults` bundles many unrelated behavior changes (cookie serializer, autoload, `to_time` zone handling — note the app already has a manual `config.active_support.to_time_preserves_timezone = :zone` override for an 8.1 deprecation, which is a sign this was already being worked around ad hoc). Stepping through versions makes it possible to attribute a test failure or behavior change to a specific default instead of debugging a combinatorial mess.
- **Fix hot-reload by adding `listen` gem before touching `bin/dev`'s process topology.** Rationale: this is a one-line, well-documented Rails idiom (evented file watching) and the cheapest, most reversible first move. Only restructure `Procfile.dev`/`bin/dev` (e.g., merging watchers, switching esbuild/sass invocation) if the `listen` gem alone doesn't resolve the sluggishness — measure before restructuring.
  - **Correction discovered during implementation**: adding the `listen` gem alone did nothing — Rails 8.1.3 does not auto-detect it (that auto-detection folklore is stale; `railties`' `Configuration#initialize` hardcodes the polling checker unconditionally). Had to explicitly set `config.file_watcher = ActiveSupport::EventedFileUpdateChecker if defined?(Listen)`. Once fixed, A/B measurement (20 requests, polling vs. evented) showed no measurable latency difference at this app's size (~160 files) — the fix is correct and future-proofs the app as it grows, but is not what's causing the perceived slowness today. The more likely culprit, found by inspecting `bin/dev`: there's no browser-side live-reload — `esbuild --watch`/`sass --watch` rebuild files, but the browser never gets told to refresh, so every JS/CSS change requires a manual reload. That's a bigger workflow change than "add a gem," so it's flagged back to the user rather than assumed in scope.
- **Confirm "dead" via routes.rb + grep before deleting, not via git history alone.** Rationale: git history shows the intent (e.g., "remove mix votes" was never finished), but the source of truth for "is this reachable" is `config/routes.rb` plus a repo-wide grep for the constant/table name. Every removal listed in the proposal was checked this way already (routes.rb has no `mix_votes`/`mixes` routes; `ratio_controller` has no `data-controller="ratio"` caller; `three` has zero matches under `app/`).
- **Drop the redundant asset pipeline gem, not the working one — decide by checking what ActiveAdmin actually needs.** `sassc-rails` is likely there only for `app/assets/stylesheets/active_admin.scss` (ActiveAdmin ships Sprockets-oriented instructions); the app's own styles are already compiled via the `sass` CLI through `cssbundling-rails`. Verify by temporarily removing `sassc-rails`/`sprockets-rails` and checking whether `/admin` still renders styled — if ActiveAdmin needs Sprockets, keep the minimal pipeline for just that asset rather than running two parallel CSS build systems for the whole app.

## Risks / Trade-offs

- [Heroku's `heroku-24` stack / `heroku/ruby` buildpack may not support Ruby 3.4 yet, or native-extension gems (`pg`, `sassc`, `nokogiri`, etc.) may need reinstalling against the new Ruby] → Mitigation: verify buildpack support before deploying; rebuild native extensions locally first (`bundle install` after switching rubies naturally does this) and catch failures there rather than on Heroku.
- [Devise 4→5 / ActiveAdmin 3.x compatibility] → Gemfile.lock history shows Devise was deliberately pinned to `~> 4.9` "for activeadmin 3.x compatibility" (commit `b96fb013`). Mitigation: check ActiveAdmin's current Devise 5 support before bumping; if unsupported, leave Devise pinned and note it as a follow-up rather than forcing a break.
- [Framework-default migration silently changes behavior specs don't cover] → e.g. cookie serialization format changes could invalidate existing sessions/remember-me tokens on deploy. Mitigation: manual smoke test of admin login and any persisted-session-dependent flow after the defaults bump, before merging.
- [Dropping `mixes`/`mix_reviews`/`mix_embeds` tables loses data if something is depended on informally, e.g. a Heroku console script or a not-yet-committed admin view] → Mitigation: back up (`pg_dump` the three tables) before writing the drop migration; hold the backup outside the repo.
- [Restructuring `bin/dev`/`Procfile.dev` regresses the working (if slow) reload setup] → Mitigation: per the decision above, try the `listen` gem in isolation first and measure; only touch the process topology as a second step if needed.
- [npm package bumps break the esbuild/sass build] → Mitigation: run `yarn build` and `yarn build:css` after each bump, not just at the end.

## Migration Plan

1. Ruby gem upgrades (`bundle update`, scoped/staged) → run specs.
2. Rails framework-defaults step-through (7.0→7.1→7.2→8.0→8.1) → run specs + manual smoke test after each step.
3. npm package upgrades → `yarn build` / `yarn build:css` sanity check.
4. Add `listen` gem, clear stale bootsnap cache, measure reload latency before/after.
5. Dead-code removal (JS deps/files, Stimulus controller, `mix_votes`/`mixes` stack, empty admin file, stray Bun scaffold) as its own small commits, easy to revert individually.
6. DB migration to drop orphaned tables, after taking a backup.
7. Asset-pipeline consolidation (drop `sassc-rails`/`sprockets-rails` if confirmed unnecessary), last, since it's the most likely to visibly break `/admin` styling if done wrong.

Rollback: each stage is a separate commit; any stage can be reverted independently since later stages don't depend on earlier ones being un-revertible (e.g., dead-code removal doesn't depend on the Rails upgrade having happened).

## Open Questions (resolved)

- **Devise 5 vs. ActiveAdmin 3.x**: verified directly — ActiveAdmin 3.5.2 has no gemspec dependency on `devise` at all (the `b96fb013` pin was about runtime behavior, not a resolvable constraint). Bumped to ActiveAdmin 3.5.2 + Devise 5.0.4, ran the full spec suite (green), and manually verified the actual login flow end-to-end (POST `/admin/login` → 302 → authenticated `/admin` dashboard with a working logout link) since no spec covers Devise sign-in. Both bumps are safe; the `~> 4.9` pin was removed from the Gemfile.
- **`mixes`/`mix_reviews`/`mix_embeds` tables**: confirmed no model/controller references anywhere in `app/` or `lib/`. Back up via `pg_dump` before dropping, since production may have rows even without app code touching them.
- **`/mix_votes` placeholder page**: user confirmed this is an unfinished feature to keep, not delete. `MixVote`/`mix_votes_controller.rb`/its views are out of scope for this change. Confirmed by manual smoke test: it's not just missing a `mix_votes` table — there's no route to it at all in `config/routes.rb`, so the whole thing 404s today. It's unreachable via HTTP, not merely broken on submit. Pre-existing gap in the unfinished feature; not something this tune-up needs to fix, but worth flagging back to the user.
