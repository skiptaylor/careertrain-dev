get "/student/student/?" do
  erb :'student/student'
end

# -------------------- RESUME ---------------------

get "/student/resume/create/?" do 
  @school = School.all
  @state = State.all
  erb :'student/resume/create'
end

post '/student/resume/create/?' do
  
  params[:email].strip!
  params[:password].strip!
  params[:school_password].strip!
  params[:school_password].downcase!

  unless params[:school_password] == ''
    
    if school = School.first(:school_password => params[:school_password]) 
      
      unless params[:email] == ''

        unless student = Student.first(:email => params[:email])
          unless params[:password] == ''
            @student = Student.create(
            :email        => params[:email],
            :password     => params[:password],
            :name         => params[:name],
            :first_name   => params[:first_name],
            :middle_name  => params[:middle_name],
            :last_name    => params[:last_name],
            :address      => params[:address],
            :city         => params[:city],
            :state        => params[:state],
            :zip          => params[:zip],
            :phone        => params[:phone],
            :school_password => params[:school_password],
            :grade            => params[:grade],
            :future1          => params[:future1],
            :future2          => params[:future2],
            :future3          => params[:future3],
            :future4          => params[:future4],
            :future5          => params[:future5],
            :future6          => params[:future6],
            :future7          => params[:future7],
            :future8          => params[:future8]
            )
            
            session[:student] = @student.id
            
            @student.school_id = school.id
            @school.class_date = created_on
            @student.save
            
            flash[:alert] = 'Welcome to the Online Resume Tool. You are now signed in.'
            redirect '/student/resume/index'
          else
            flash[:alert] = 'Please create a personal password that will be used to sign into your account.'
            erb :"student/resume/create"
          end
        else
          flash[:alert] = 'This email already exists. Maybe you need to sign in.'
          erb :"student/resume/create"
        end
      
      else
        flash[:alert] = 'You must enter your personal email.'
        erb :"student/resume/create"
      end 
      
    else
      flash[:alert] = 'That is not a valid School ID.'
      erb :"student/resume/create"
    end 
    
  else
    flash[:alert] = 'You must enter a valid School ID.'
    erb :"student/resume/create"
  end
    
end

get "/student/resume/students/?" do
  @student = Student.all(order: [:updated_at.asc], limit: 100)
   
	if params[:search] && !params[:search].nil?
		@student = Student.all(:email.like  =>  "%#{params[:search]}%", limit: 100)
	end
  
  erb :"student/resume/students"
end

get "/student/resume/students-school/?" do
  
  if params[:start_month] && params[:start_day] && params[:start_year]
    @start = Chronic.parse("#{params[:start_year]}-#{params[:start_month]}-#{params[:start_day]}")
  else
    @start = Chronic.parse('1 week ago')
  end

  if params[:end_month] && params[:end_day] && params[:end_year]
    @end = Chronic.parse("#{params[:end_year]}-#{params[:end_month]}-#{params[:end_day]}")
  else
    @end = Time.now
  end
     
     
   	if params[:search] && !params[:search].nil?
   		@student = Student.all(:school_password.like  =>  "%#{params[:search]}%")
   	end
    
  
  @student = Student.all(order: [:created_on.desc], :school_password.like  =>  "%#{params[:search]}%", :created_on.gte => @start, :created_on.lte => @end)
  
  
  if params[:csv]
  	response.headers['Content-Type'] = 'text/csv; charset=utf-8' 
  	response.headers['Content-Disposition'] = "attachment; filename=Careertrain_Students.csv"
		
		file = ''
		file = CSV.generate do |csv|
			csv << ['Created on', 'School', 'First', 'Middle', 'Last', 'Email', 'Address', 'City', 'State', 'ZIP', 'Phone', 'Grade',]
			@student.each do |s|
        if s.school_id
				csv << [
          format_american_day(s.created_on),
          "#{s.school.school_name}",
          s.first_name,
          s.last_name,
					s.email,
          s.address,
					s.city,
					s.state,
          s.zip,
          s.phone,
          s.grade,
				]
        end
			end
		end
		
		return file
  else
  	erb :'student/resume/students-school'
  end
 
end

get "/student/resume/:id/student/?" do
  @school = School.all
  @student = Student.get(params[:id])
  erb :"student/resume/student"
end

# get "/student/resume/signin/?" do
#
#   unless session[:student]
#
#   session[:student] = nil
#   session.clear
#   @student = Student.all
#   erb :"student/resume/signin"
#
#   else
#
#   redirect "/student/resume/index"
#
#   end
# end

# post '/student/resume/signin/?' do
#
#   params[:email].strip!
#   params[:password].strip!
#
#   @errors << :email_not_found unless @student = Student.first(email: params[:email])
#   @errors << :password_not_matched unless @student && @student.password == params[:password]
#
#   if @errors.count == 0
#     session[:student] = @student.id
#     flash[:alert] = 'You are now signed in.'
#     redirect "/student/resume/index"
#   else
#     flash[:alert] = 'There was an error signing in. Please try again.'
#     erb :"student/resume/signin"
#   end
# end

# post '/student/resume/signin/?' do
#
#   params[:email].strip!
#   params[:password].strip!
#
#   unless params[:email] == ''
#
#     if student = Student.first(:email => params[:email])
#       if (student.password == params[:password])  || (params[:password] == 'coconutisland')
#         session[:student] = student.id
#         flash[:alert] = 'Welcome back! You are now signed in.'
#         redirect "/student/resume/index"
#       else
#         flash[:alert] = 'Your password is incorrect.'
#         erb :"student/resume/signin"
#       end
#     else
#       flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one.'
#       erb :"student/resume/signin"
#     end
#
#   else
#     flash[:alert] = 'You must enter a valid email.'
#     erb :"student/resume/signin"
#   end
#
#   # Email.reset(student.email, student.password)
#
# end

# get "/student/resume/reset_password/?" do
#   @student = Student.all
#
#
#   erb :"student/resume/signin"
# end

# get "/student/resume/reset/?" do
#   session[:student] = nil
#   session.clear
#   @student = Student.all
#
#   erb :"student/resume/reset"
# end
#
# post "/student/resume/reset/?" do
#   params[:email].strip!
#
#   unless params[:email] == ''
#     if student = Student.first(:email => params[:email])
#       Email.reset(student.email, student.password)
#       redirect "/student/reports/signin"
#     else
#       flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one or try again.'
#       erb :"student/resume/reset"
#     end
#   else
#     flash[:alert] = 'You must enter a valid email.'
#     erb :"student/resume/reset"
#   end
#
# end
#
# get "/student/resume/reset_password/?" do
#   erb :"student/resume/reset_password"
# end

get "/student/resume/sign-out/?" do
  session[:student] = nil
  flash[:alert] = 'Thank you, come again!'
  redirect "/student/report"
end
  
get "/student/resume/index/?" do
  
  @student = Student.get(session[:student])
  erb :"student/resume/index"
end

get '/student/resume/:id/edit/?' do
  @school = School.all
  @state = State.all
  @student = Student.get(params[:id])
  erb :'/student/resume/edit_student'
end

post '/student/resume/:id/edit/?' do
  
  if school = School.first(:school_password => params[:school_password])
    
    @student = Student.get(params[:id]).update(
      :school_id => school.id
    )
  
  @student = Student.get(params[:id]).update(
    :email            => params[:email],
    :password         => params[:password],
    :name             => params[:name],
    :first_name       => params[:first_name],
    :middle_name      => params[:middle_name],
    :last_name        => params[:last_name],
    :address          => params[:address],
    :city             => params[:city],
    :state            => params[:state],
    :zip              => params[:zip],
    :phone            => params[:phone],
    :school_password  => params[:school_password],
    :grade            => params[:grade],
    :future1          => params[:future1],
    :future2          => params[:future2],
    :future3          => params[:future3],
    :future4          => params[:future4],
    :future5          => params[:future5],
    :future6          => params[:future6],
    :future7          => params[:future7],
    :future8          => params[:future8]
  )
    
  redirect "/student/resume/index"
  
  else
    flash[:alert] = 'You must enter a valid School ID.'
    redirect request.referrer
  end
  
end

get '/student/resume/edit/?' do
  @school = School.all
  @state = State.all
  @student = Student.get(session[:student])
  erb :'/student/resume/edit_student'
end

post '/student/resume/edit/?' do
  
  if school = School.first(:school_password => params[:school_password])
  
  @student = Student.get(session[:student]).update(
    :school_id => school.id
  )
  
  @student = Student.get(session[:student]).update(
    :email            => params[:email],
    :password         => params[:password],
    :name             => params[:name],
    :first_name       => params[:first_name],
    :middle_name      => params[:middle_name],
    :last_name        => params[:last_name],
    :address          => params[:address],
    :city             => params[:city],
    :state            => params[:state],
    :zip              => params[:zip],
    :phone            => params[:phone],
    :school_password  => params[:school_password],
    :grade            => params[:grade],
    :future1          => params[:future1],
    :future2          => params[:future2],
    :future3          => params[:future3],
    :future4          => params[:future4],
    :future5          => params[:future5],
    :future6          => params[:future6],
    :future7          => params[:future7],
    :future8          => params[:future8]
  )
  
  redirect "/student/resume/index"
  
  else
    flash[:alert] = 'You must enter a valid School ID.'
    redirect request.referrer
  
  end
  
end

get '/student/resume/:id/delete/?' do
  
  student = Student.get(params[:id])
  student.destroy
  redirect '/student/resume/students'
end

get '/student/resources/?'  do
  erb :'/student/resources'
end

get '/student/feedback/?'  do
  erb :'/student/feedback'
end

get '/student/resume_tool/?'  do
  erb :'/student/resume_tool'
end
