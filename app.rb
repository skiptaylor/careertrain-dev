require 'bundler/setup'
Bundler.require

require 'sinatra'
require 'sinatra/chassis/helpers'

require 'sinatra/reloader' if development?

require 'sendgrid-ruby'
include SendGrid
require 'json'

disable :protection
enable :sessions
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
