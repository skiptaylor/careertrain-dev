require 'bundler/setup'
Bundler.require

require 'sinatra/chassis/helpers'

require 'sinatra/reloader' if development?

require_directory(settings.load_path)

enable :sessions
set :session_secret, 'secret123'

get '/?' do
  @readme = ''  
  File.open('./README.md') do |file|
  	file.each_line { |line| @readme << line }
  end
  
	erb :readme, layout: false
end
