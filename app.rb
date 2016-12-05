require 'bundler/setup'
Bundler.require

require 'sinatra'
require 'sinatra/chassis/helpers'

require 'sinatra/reloader' if development?

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

# Try it now!
configure :production do
  before do
    unless request.request_method == 'POST'
      unless request.url.include? "https://www."
        redirect "https://www.careertrain.com#{request.path}"
      end
    end
  end
end

get '/*/?' do
	puts "--> #{request.referrer} // #{request.user_agent} // #{request.xhr?} // #{request.ip}"
	erb :"#{params[:splat].first}"
end

DataMapper.finalize
