require 'rubygems'
require 'bundler/setup'

Bundler.require

require 'sinatra/namespace'
require 'sinatra'
require 'sinatra/chassis/helpers'
require 'sequel'
require 'sinatra/sequel'
require 'net/http'
require 'chronic'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
require 'sendgrid-ruby'
include SendGrid
require 'json'

require 'pdfkit'

Dotenv.load


configure do

  use Rack::Protection, :except => :session_hijacking
  enable :sessions
  use Rack::Session::Cookie, :key => 'rack.session',
                             :secret => 'c73a5a9ce51f3a26388f70af6ffa040216136e45b48015e22a21ddf3513d25c2',
                             :expire_after => ENV.fetch("EXPIRE").to_i
  set :database,       ENV.fetch('DATABASE_URL')
  set :session_secret, ENV.fetch('SESSION_SECRET')
  set :views,          ['./views', "#{File.dirname(__FILE__)}/views"]

end

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

