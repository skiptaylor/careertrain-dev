require 'bundler/setup'
Bundler.require

require 'sinatra'
require 'sinatra/chassis/helpers'

require 'sinatra/reloader' if development?

require 'sendgrid-ruby'
include SendGrid
require 'json'

require 'pdfkit'


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


configure :production do
  before do
    unless request.request_method == 'POST'
      unless request.url.include? "https://www."
        redirect "https://www.ecareerdirection.com#{request.path}"
      end
    end
  end
end



DataMapper.finalize
