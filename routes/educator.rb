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
  body << "<h3>Educator Request for eCD Program</h3>"
  body << "<p><b>School:</b> #{params[:school_name]}</p>"
  body << "<p>#{params[:school_address1]} <br />#{params[:school_address2]} <br />#{params[:school_city]} #{params[:state]} #{params[:school_zip]}</p>"
  body << "<p><b>Contact:</b> #{params[:first_name]} #{params[:last_name]}</p>"
  body << "<p><b>Email:</b> #{params[:email]}</p>"
  body << "<p><b>Phone:</b> #{params[:phone]}</p>"
  body << "<p><b>Number of students:</b> #{params[:students]}</p>"
  body << "<p><b>#{params[:cd_used]}</b></p>"

  Pony.mail(
    headers: { 'Content-Type' => 'text/html' },
    to: 'info@careertrain.com, skip@recountant.com',
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