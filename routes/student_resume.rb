get "/student/student/?" do
  erb :'student/student'
end

# -------------------- RESUME ---------------------

get "/student/resume/create/?" do 
  @school = School.all
  @state = State.all
  erb :'studens/resume/create'
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
            @students = Student.create(
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
  auth_admin
  @student = Student.order(:created_at).limit(100)
   
	if params[:search] && !params[:search].nil?
    @student = Student.where(Sequel.like(:email, "%#{params[:search]}%")).limit(100)
	end
  
  erb :"student/resume/students"
end

get "/student/resume/students-school/?" do
  auth_admin
  
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
    @student = Student.where(Sequel.like(:school_password, "%#{params[:search]}%"))
  end
    
  @student = Student.order(:created_on).where(Sequel.like(:school_password, "%#{params[:search]}%")).where(created_on: (@start)..(@end))   
     
     # @student = Student.order(:created_on).where(Sequel.like(:school_password, "%#{params[:search]}%")).where([':created_on'] >= [params['start_date']]).where([':created_on'] <= [params['endt_date']])

# @student = Student.order(:created_on).where(Sequel.like(:school_password, "%#{params[:search]}%")).where('created_on >= ?' => @start).where('created_on <= ?' => @end)

  if params[:csv]
  	response.headers['Content-Type'] = 'text/csv; charset=utf-8' 
  	response.headers['Content-Disposition'] = "attachment; filename=eCD_Students.csv"
		
		file = ''
		file = CSV.generate do |csv|
			csv << ['Created on', 'School', 'First', 'Last', 'Email', 'Address', 'City', 'State', 'ZIP', 'Phone', 'Grade',]
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
  auth_admin
  
  @school = School.all
  @student = Student[params[:id]]
  erb :"student/resume/student"
end


get "/student/resume/sign-out/?" do
  session[:student] = nil
  flash[:alert] = 'Thank you, come again!'
  redirect "/student/report"
end
  
get "/student/resume/index/?" do
  auth_student
  @student = Student[session[:student]]
  erb :"student/resume/index"
end

get '/student/resume/:id/edit/?' do
  auth_student
  @school = School.all
  @state = State.all
  @student = Student[params[:id]]
  erb :'/students/resume/edit_student'
end

post '/student/resume/:id/edit/?' do
  auth_student
  if school = School.first(:school_password => params[:school_password])
    
    @student = Student[params[:id]].update(
      :school_id => school.id
    )
  hashed_password = BCrypt::Password.create(params[:password])
  @student = Student[params[:id]].update(
    :email            => params[:email],
    :password         => hashed_password,
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
  auth_student
  @school = School.all
  @state = State.all
  @student = Student[session[:student]]
  erb :'/student/resume/edit_student'
end

post '/student/resume/edit/?' do
  auth_student
  if school = School.first(:school_password => params[:school_password])
  
  @student = Student[session[:student]].update(
    :school_id => school.id
  )
  hashed_password = BCrypt::Password.create(params[:password])
  @student = Student[session[:student]].update(
    :email            => params[:email],
    :password         => hashed_password,
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
  auth_student
  student = Student[params[:id]]
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
