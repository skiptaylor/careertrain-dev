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
  school = School.create(
    :school_id              => params[:school_id],
    :date_modified          => params[:date_modified],
    :first_name             => params[:first_name],
    :middle_initial         => params[:middle_initial],
    :last_name              => params[:last_name],
    :school_name            => params[:school_name],
    :school_address1        => params[:school_address1],
    :school_address2        => params[:school_address2],
    :school_city            => params[:school_city],
    :school_state           => params[:school_state],
    :school_zip             => params[:school_zip],
    :phone                  => params[:phone],
    :fax                    => params[:fax],
    :ng_rep                 => params[:ng_rep],
    :email                  => params[:email],
    :number_seniors         => params[:number_seniors]
  )
  
 Email.requestcd2(school.school_name, school.school_address1, school.school_address2, school.school_city, school.school_state, school.school_zip, school.first_name, school.last_name, school.email, school.phone, school.fax)
  
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