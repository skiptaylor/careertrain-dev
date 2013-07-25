require 'bundler/setup'
Bundler.require

require 'sinatra/chassis/helpers'

require 'sinatra/reloader' if development?

set :session_secret, 'secret123'

require_directory([
  'config',
  'settings',
  'modules',
  'helpers',
  'libraries',
  'models',
  'controllers',
  'routes'
])

DataMapper.finalize
