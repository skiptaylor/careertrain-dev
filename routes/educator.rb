['/student/resume/sign-in/?'].each do |path|
  before(path) { authenticate :educator }
end

get '/educator/request/?' do
  @state = State.all
  erb :"/educator/request"
end

post '/educator/request/?' do
  state = State.all
  
  body = ''
  body << "<h3>Request eCD Program from Educator</h3>"
  body << "<p><i>(School not yet active)</i></p>"
  body << "<p><b>School Name:</b> #{params[:school_name]}</p>"
  body << "<p>#{params[:school_address1]}</p>"
  body << "<p>#{params[:school_address2]}</p>"
  body << "<p>#{params[:school_city]} #{params[:state]} #{params[:school_zip]}</p>"
  body << "<p><b>Contact:</b> <b>#{params[:first_name]} #{params[:last_name]}</p>"
  body << "<p><b>Email:</b> <b>#{params[:email]}</p>"
  body << "<p><b>Phone:</b> <b>#{params[:phone]}</p>"

  Pony.mail(
    headers: { 'Content-Type' => 'text/html' },
    to: 'skip@recountant.com',
    from: 'no-reply@eCareerDirection.com',
    subject: 'Request eCD Program from Educator',
    body: body
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