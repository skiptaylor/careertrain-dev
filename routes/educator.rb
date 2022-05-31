['/student/resume/sign-in/?'].each do |path|
  before(path) { authenticate :educator }
end

get '/educator/request/?' do
  @state = State.all
  erb :"/educator/request"
end

post '/educator/request/?' do
  state = State.all
  

  Pony.mail(
    headers: { 'Content-Type' => 'text/html' },
    to: 'skip@recountant.com',
    from: 'no-reply@eCareerDirection.com',
    subject: 'Request eCD Program from Educator',
    body: "<p><b>School Name:</b> #{params[:school_name]}</p>"
  )  
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