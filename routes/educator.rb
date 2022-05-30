['/student/resume/sign-in/?'].each do |path|
  before(path) { authenticate :educator }
end

get '/educator/request/?' do
  @state = State.all
  @school = School.new
  erb :"/educator/request"
end

post '/educator/request/?' do
  state = State.all
  
 Email.requestcd2(school_name, school_address1, school_address2, school_city, state, school_zip, first_name, last_name, email, phone)
  
  redirect "/educator/thanks"
end

get '/educator/resume/?' do
  @school = School.all
  unless params[:zip]
    @results = []
  else
    @results = School.all(school_zip: params[:zip].strip.downcase)
  end
  erb :"/educator/resume"
end

get '/educator/thanks/?' do
  erb :"/educator/thanks"
end