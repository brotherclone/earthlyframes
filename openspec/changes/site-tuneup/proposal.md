## Why

The app hasn't had a maintenance pass in a while: Rails is running on `config.load_defaults 7.0` even though the `rails` gem itself is already at 8.0.2.1 (Rails 8.1 is out), dozens of gems and npm packages are behind, local dev reload is sluggish, and several rounds of feature removal (SoundCloud, music videos, social, ytr/bandcamp) have left orphaned models, tables, admin resources, and JS behind. This change does a general tune-up: upgrade dependencies, adopt current Rails framework defaults, restore fast hot-reloading in development, and remove the dead code so the codebase matches what the site actually does today.

## What Changes

- **BREAKING** (internal): Upgrade Ruby 3.3.0 → 3.4.x locally, in `.ruby-version`/Gemfile, and on Heroku. Discovered mid-upgrade: Rails 8.1.3's `actionview` uses anonymous rest-parameter forwarding into a nested block, a construct Ruby 3.3 cannot parse (`SyntaxError: anonymous rest parameter is also used within block`) despite the gemspec claiming `>= 3.2.0`. Rails 8.1 is not usable on Ruby 3.3 in practice.
- Bump Ruby gems to latest compatible versions (Rails 8.0.2.1 → 8.1.x, devise, activeadmin, rspec-rails, etc. per `bundle outdated`).
- Adopt Rails new-framework-defaults progressively (currently pinned at `7.0` despite running the 8.0 gem) up through 8.1, resolving any behavior changes that surface. **BREAKING** (internal): may change cookie/serialization/autoload behavior — needs a manual smoke test pass, not just green specs.
- Update npm/yarn packages (`esbuild`, `sass`, `stimulus-use`, etc.) to current versions; consolidate on a single package manager (yarn is declared in `package.json`/`engines` but `bun.lockb` and a stray `index.ts`/`tsconfig.json` Bun scaffold also exist untracked).
- Fix development hot-reloading. Three real, distinct bugs found and fixed:
  1. Added the `listen` gem and explicitly set `config.file_watcher = ActiveSupport::EventedFileUpdateChecker` (Rails does not auto-detect the `listen` gem, contrary to common folklore — verified against Rails 8.1.3 source). Measured impact is negligible at this app's size, but it's the technically-correct config.
  2. **Root cause of the actual complaint**: `public/assets/` held a fully precompiled Sprockets manifest from an old `assets:precompile` run, dated months back. Since those files physically exist, Rails serves them directly in development too, bypassing live compilation entirely — meaning CSS/JS edits could go completely unreflected no matter how many times you refreshed, not just "slow." Deleted it (confirmed gitignored/untracked, safe).
  3. Added real browser auto-refresh on save (`guard` + `guard-livereload` + `rack-livereload`, wired into `Procfile.dev`), since previously every JS/CSS change required a manual browser reload even when the build succeeded. Also fixed guard-livereload's default CSS-live-swap behavior, which is incompatible with Sprockets' fingerprinted URLs (`apply_css_live: false`, forcing full-page reload instead).
  - Also cleared/rebuilt the 232MB stale bootsnap cache (regenerated clean at 30MB).
- Remove dead code left over from prior feature removals:
  - Orphaned `mixes`, `mix_reviews`, `mix_embeds`, and `reviewers` DB tables, plus the empty `app/admin/mix.rb` and `app/admin/reviewer.rb` stubs — none have any model/controller referencing them (distinct from `MixVote`, which is a separate, unfinished feature being kept — see below). `reviewers` was found mid-cleanup: same dead feature (`mix_reviews.reviewer_id`), no `Reviewer` model ever existed, zero references anywhere.
  - `MixVote`/`mix_votes_controller.rb`/its views are **kept as-is** (unfinished feature, not in scope for this change) but note: there is no `mix_votes` table in `db/schema.rb`, so the `create` action would fail at runtime today. Flagged as a pre-existing gap, not something this tune-up fixes.
  - Unused Stimulus controller `ratio_controller.js` (built for the now-removed video embeds) and its `stimulus-use` dependency if nothing else uses it.
  - Unused npm packages `three`, `three-css2drender`, and `@popperjs/core` (no references anywhere in `app/javascript`).
  - Redundant/duplicate `esbuild.config.js` at the repo root (the actual build path is the `esbuild` CLI invocation in `package.json`'s `build` script, not this file).
  - Truncate/rotate oversized `log/development.log` (42MB) and `log/test.log` (52MB).
- Investigated the asset pipeline (`sprockets-rails` + `sassc-rails` + `cssbundling-rails` all present together, initially suspected as redundant). **Finding: not actually redundant** — `sprockets-rails` fingerprints/serves the whole site's CSS/JS (verified via the served URL), and `sassc-rails` is the only Sass processor available to compile ActiveAdmin's own SCSS. No changes made here; a real consolidation would mean migrating off Sprockets entirely (e.g. to Propshaft), which is out of scope for this tune-up.

## Capabilities

### New Capabilities
- `dev-environment`: Requirements for the local development experience — file-change reload latency, asset (JS/CSS) rebuild-and-refresh latency, and boot time. This is the capability the hot-reload fix is accountable to.

### Modified Capabilities
(none — no existing `openspec/specs/` entries yet; this is the first tracked change in this repo)

## Impact

- **Ruby version**: 3.3.0 → 3.4.x. Affects `.ruby-version`, `Gemfile`'s `ruby` directive, `Gemfile.lock`'s `RUBY VERSION`, local rvm/rbenv rubies, and the Heroku `heroku/ruby` buildpack on the `heroku-24` stack — needs verification that the stack supports 3.4 before deploying.
- **Gemfile / Gemfile.lock**: version bumps across ~40 gems; `config/application.rb` framework defaults version bump; possible Rails-generated config diffs in `config/environments/*`.
- **package.json / yarn.lock**: version bumps; possible removal of `bun.lockb`, `index.ts`, `tsconfig.json` if confirmed unused; removal of `three`, `three-css2drender`.
- **Database**: migration to drop `mixes`, `mix_reviews`, `mix_embeds`, `reviewers` tables only (backed up first). `mix_votes`/`MixVote` is untouched.
- **Code removed**: `app/views/mixes/**` (orphaned, unrelated to `MixVote`), `app/admin/mix.rb`, `app/admin/reviewer.rb`, `app/javascript/controllers/ratio_controller.js`, `esbuild.config.js`, `index.ts`, `tsconfig.json`, `bun.lockb`. `MixVote`/`mix_votes_controller.rb`/`app/views/mix_votes/**` are kept.
- **Ops**: `log/*.log` truncation, `tmp/cache/bootsnap` cache clear, `public/assets/` deletion (stale precompiled artifacts — regenerates automatically via `assets:precompile` at deploy time, never should have been present in a dev checkout) — no code impact, just local dev hygiene.
- **New dev-only dependencies**: `guard`, `guard-livereload`, `rack-livereload` (Gemfile, `:development` group only — not in production). New `Guardfile`. `Procfile.dev` gets a fourth process (`livereload: bundle exec guard`).
- **Risk**: Rails framework-default migration and gem major-version bumps (devise 4→5, activeadmin, haml-rails) are the riskiest parts and need a full manual smoke test of the site (admin login, album/song pages, streaming links, EULA, mix-vote page if kept) before merging.
