
  
  ['/student/resume/sign-in/?'].each do |path|
    before(path) { authenticate :educator }
  end
  
  get '/educator/request/?' do
    @school = School.new
    erb :"/educator/request"
  end

  post '/educator/request/?' do
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