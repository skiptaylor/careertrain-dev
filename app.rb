require 'bundler/setup'
Bundler.require

require 'sinatra/chassis/helpers'

require 'sinatra/reloader' if development?

use Rack::Protection, :except => :session_hijacking
enable :sessions
set :session_secret, 'supersecret'
use Rack::Session::Cookie,  :Key => 'rack.session', 
                            :secret => 'secret123'

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

DataMapper.finalize
