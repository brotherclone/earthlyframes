# The Earthly Frames
Gabriel Walsh's current musical moniker.
# Development Info
- Rails 7.0.2
- Ruby 3.3.0
To run: $
`bin/dev`
Run `bundle exec rails assets:precompile` and then `yarn build` and `yarn build:css` to precompile assets for production.
- Uses esbuild, not importmap-rails
- PostgreSQL
# API
- Use albums.json to retrieve discography
- Use streaming_services.json for details on music availability