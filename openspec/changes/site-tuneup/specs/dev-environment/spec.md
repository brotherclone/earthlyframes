## ADDED Requirements

### Requirement: Evented file watching in development
The development environment SHALL use evented (not polling) file-system watching to detect Ruby code changes, so Zeitwerk reload latency does not scale with stat-call polling overhead.

#### Scenario: Listen gem present and active
- **WHEN** the app boots in the `development` environment
- **THEN** `Rails.application.config.file_watcher` resolves to `ActiveSupport::EventedFileUpdateChecker` (implying the `listen` gem is loaded), not the default polling `ActiveSupport::FileUpdateChecker`

### Requirement: Fast code-change reload
Editing a Ruby file under `app/` SHALL be reflected on the next request without a full manual server restart, within a latency noticeably faster than the pre-tune-up baseline.

#### Scenario: Controller edit picked up on next request
- **WHEN** a developer edits a controller or model file while `bin/rails server` is running in development
- **THEN** the next HTTP request to an affected route reloads just the changed file(s) via Zeitwerk and serves the updated behavior, without requiring a manual server restart

### Requirement: Fast asset rebuild-and-refresh
Editing a JavaScript or SCSS/Sass source file SHALL trigger an automatic rebuild via the existing `esbuild --watch` / `sass --watch` processes and be visible on browser refresh without manual intervention, and unused JS dependencies SHALL NOT be part of what gets rebuilt on every change.

#### Scenario: JS change rebuilds without unused dependencies in the bundle
- **WHEN** a developer edits a file under `app/javascript` while `bin/dev` is running
- **THEN** `esbuild` rebuilds `app/assets/builds/application.js` and the bundle does not include `three`/`three-css2drender` or other packages with zero references under `app/javascript`

#### Scenario: SCSS change rebuilds
- **WHEN** a developer edits a file under `app/assets/stylesheets`
- **THEN** the `sass --watch` process rebuilds `app/assets/builds/application.css` and the browser reflects the change on refresh

### Requirement: Clean local dev cache state
Stale build caches SHALL NOT be a hidden source of slow or incorrect development reloads.

#### Scenario: Bootsnap cache is current after a gem/Ruby-version change
- **WHEN** the Gemfile.lock or `.ruby-version` changes as part of this tune-up
- **THEN** `tmp/cache/bootsnap` is cleared and allowed to regenerate, rather than serving stale compiled-code caches against the new gem versions
