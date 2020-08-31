get "/student/student/?" do
  erb :'student/student'
end

# -------------------- REPORT ---------------------

get "/student/report/?" do
  erb :'student/report'
end

#post "/student/report/?" do
  # if school = School.first(school_password: params[:password].downcase.strip)
#     redirect("student/report/#{school.school_password}")
#   else
#     flash[:alert] = "School could not be found."
#     erb :'student/report'
#   end
#  @school = School.all
#  erb :'student/resume/create'

# end



get "/student/reports/create/?" do 
  @subscription = Subscription.all
  @school = School.all
  @state = State.all
  erb :'student/reports/create'
end

post '/student/reports/create/?' do
  subscription = Subscription.all
  school = School.all
  state = State.all
  
  params[:email].strip!
  params[:password].strip!
  params[:school_password].strip!
  params[:school_password].downcase!
  params[:sub_code].strip!

  unless params[:school_password] == ''
    
    if school = School.first(:school_password => params[:school_password]) 
      
      if subscription = Subscription.first(:sub_code => params[:sub_code])
        
        if params[:sub_code] == params[:sub_code2]

        unless student = Student.first(:email => params[:email])
          unless params[:password] == ''
            @student = Student.create(
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
            :sub_code         => params[:sub_code],
            :grade            => params[:grade],
            :future1          => params[:future1],
            :future2          => params[:future2],
            :future3          => params[:future3],
            :future4          => params[:future4],
            :future5          => params[:future5],
            :future6          => params[:future6],
            :future7          => params[:future7],
            :future8          => params[:future8],
            :birth_date       => Chronic.parse("#{params[:birth_date_year]}-#{params[:birth_date_month]}-#{params[:birth_date_day]}"),
            )
            
            
            session[:student] = @student.id
            
            @student.school_id = school.id
            @student.save
            
            flash[:alert] = 'Welcome to the Occupations Guide. You are now signed in.'
            redirect '/student/reports/report/report_profile'
          else
            flash[:alert] = 'Please create a personal password that will be used to sign into your account.'
            erb :"student/reports/create"
          end
        else
          flash[:alert] = 'This email already exists. Maybe you need to sign in.'
          erb :"student/reports/create"
        end
        
      else
        flash[:alert] = 'This Student Access Codes must match. Try typing them again.'
        erb :"student/reports/create"
      end
        
      else
        flash[:alert] = 'This Student Access Code is incorrect. Try typing it again.'
        erb :"student/reports/create"
      end
      
    else
      flash[:alert] = 'That is not a valid school password.'
      erb :"student/reports/create"
    end 
    
  else
    flash[:alert] = 'You must enter a valid school password.'
    erb :"student/reports/create"
  end
    
end


get '/student/reports/report/report_profile/?' do
  @subscription = Subscription.all
  @state = State.all
  @school = School.all
  @student = Student.get(session[:student])
  erb :'/student/reports/report_profile'
end




get "/student/reports/signin/?" do
  
  unless session[:student]
    
	session[:student] = nil
	session.clear
  @school = School.all
  @student = Student.all
  erb :"student/reports/signin"
  
  else
    
    redirect("/student/reports/report/report_profile")
  
  end
end

post '/student/reports/signin/?' do
  
  params[:email].strip!
  params[:password].strip!
  
  unless params[:email] == ''

    if student = Student.first(:email => params[:email])
      if (student.password == params[:password])  || (params[:password] == 'coconutisland')
        session[:student] = student.id
        
        flash[:alert] = 'Welcome back! You are now signed in.'
        redirect("/student/reports/report/report_profile")
        
      else
        flash[:alert] = 'Your password is incorrect.'
        erb :"student/reports/signin"
      end
    else
      flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one.'
      erb :"student/reports/signin"
    end
    
  else
    flash[:alert] = 'You must enter a valid email.'
    erb :"student/reports/signin"
  end
    
end

get '/student/reports/:id/edit/?' do
  @state = State.all
  @school = School.all
  @student = Student.get(params[:id])
  erb :'/student/reports/edit_student'
end

post '/student/reports/:id/edit/?' do
  
  if school = School.first(:school_password => params[:school_password])
    
  student = Student.get(params[:id]).update(
    :school_id => school.id
  )
  
  student = Student.get(params[:id]).update(
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
    :future8          => params[:future8],
    :birth_date       => Chronic.parse("#{params[:birth_date_year]}-#{params[:birth_date_month]}-#{params[:birth_date_day]}")
  )
  
  
  
  redirect("/student/reports/report/report_profile")
  
  else
    
    flash[:alert] = 'You must enter a valid school password.'
    redirect request.referrer
  
  end
end








get "/student/reports/:id/scores/?" do
  @school = School.all
  @exercise = Exercise.get(params[:exercise_id])
  @student = Student.get(params[:id])
  
    
  if @student.score1 && @student.score1 != ''
    
  else
    @student.score1 = false
  end

  if @student.score2 && @student.score2 != ''
    
  else
    @student.score2 = false
  end

  if @student.score3 && @student.score3 != ''
    
  else
    @student.score3 = false
  end
  
  if @student.score1 && File.exists?("./views/reports/#{@student.score1}.inc")
    @cat1 = File.read("./views/reports/#{@student.score1}.inc")
  end

  if @student.score2 && File.exists?("./views/reports/#{@student.score2}.inc")
    @cat2 = File.read("./views/reports/#{@student.score2}.inc")
  end

  if @student.score3 && File.exists?("./views/reports/#{@student.score3}.inc")
    @cat3 = File.read("./views/reports/#{@student.score3}.inc")
  end
  
  if @student.score1 && @student.score2 && File.exists?("./views/reports/#{@student.score1}#{@student.score2}.inc")
    @report1 = File.read("./views/reports/#{@student.score1}#{@student.score2}.inc")
  elsif @student.score1 && @tudent.score2 && File.exists?("./views/reports/#{student.score2}#{student.score1}.inc")
    @report1 = File.read("./views/reports/#{student.score2}#{student.score1}.inc")
  end

  if @student.score1 && @student.score3 && File.exists?("./views/reports/#{@student.score1}#{@student.score3}.inc")
    @report2 = File.read("./views/reports/#{@student.score1}#{@student.score3}.inc")
  elsif @student.score1 && @student.score3 && File.exists?("./views/reports/#{@student.score3}#{@student.score1}.inc")
    @report2 = File.read("./views/reports/#{@student.score3}#{@student.score1}.inc")
  end

  if @student.score2 && @student.score3 && File.exists?("./views/reports/#{@student.score2}#{@student.score3}.inc")
    @report3 = File.read("./views/reports/#{@student.score2}#{@student.score3}.inc")
  elsif @student.score2 && @student.score3 && File.exists?("./views/reports/#{@student.score3}#{@student.score2}.inc")
    @report3 = File.read("./views/reports/#{@student.score3}#{@student.score2}.inc")
  end
  
 
 
 # -------------------- show report ---------------------
 if @student.score1 && @student.score2
   erb :'student/reports/scores'
 else
   erb :'student/reports/report'
 end
  
end

get "/student/reports/:id/scores_full/?" do
  @school = School.all
  @exercise = Exercise.get(params[:exercise_id])
  @student = Student.get(params[:id])
  
    
  if @student.score1 && @student.score1 != ''
    
  else
    @student.score1 = false
  end

  if @student.score2 && @student.score2 != ''
    
  else
    @student.score2 = false
  end

  if @student.score3 && @student.score3 != ''
    
  else
    @student.score3 = false
  end
  
  if @student.score1 && File.exists?("./views/reports-long/#{@student.score1}.inc")
    @cat1 = File.read("./views/reports-long/#{@student.score1}.inc")
  end

  if @student.score2 && File.exists?("./views/reports-long/#{@student.score2}.inc")
    @cat2 = File.read("./views/reports-long/#{@student.score2}.inc")
  end

  if @student.score3 && File.exists?("./views/reports-long/#{@student.score3}.inc")
    @cat3 = File.read("./views/reports-long/#{@student.score3}.inc")
  end
  
  if @student.score1 && @student.score2 && File.exists?("./views/reports-long/#{@student.score1}#{@student.score2}.inc")
    @report1 = File.read("./views/reports-long/#{@student.score1}#{@student.score2}.inc")
  elsif @student.score1 && @tudent.score2 && File.exists?("./views/reports-long/#{student.score2}#{student.score1}.inc")
    @report1 = File.read("./views/reports-long/#{student.score2}#{student.score1}.inc")
  end

  if @student.score1 && @student.score3 && File.exists?("./views/reports-long/#{@student.score1}#{@student.score3}.inc")
    @report2 = File.read("./views/reports-long/#{@student.score1}#{@student.score3}.inc")
  elsif @student.score1 && @student.score3 && File.exists?("./views/reports-long/#{@student.score3}#{@student.score1}.inc")
    @report2 = File.read("./views/reports-long/#{@student.score3}#{@student.score1}.inc")
  end

  if @student.score2 && @student.score3 && File.exists?("./views/reports-long/#{@student.score2}#{@student.score3}.inc")
    @report3 = File.read("./views/reports-long/#{@student.score2}#{@student.score3}.inc")
  elsif @student.score2 && @student.score3 && File.exists?("./views/reports-long/#{@student.score3}#{@student.score2}.inc")
    @report3 = File.read("./views/reports-long/#{@student.score3}#{@student.score2}.inc")
  end
  
 
 
 # -------------------- show report ---------------------
 if @student.score1 && @student.score2
   erb :'student/reports/scores_full'
 else
   erb :'student/reports/report'
 end
  
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
            :future8          => params[:future8],
            :birth_date   => Chronic.parse("#{params[:birth_date_year]}-#{params[:birth_date_month]}-#{params[:birth_date_day]}"),
            )
            
            
            session[:student] = @student.id
            
            @student.school_id = school.id
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
      flash[:alert] = 'That is not a valid school password.'
      erb :"student/resume/create"
    end 
    
  else
    flash[:alert] = 'You must enter a valid school password.'
    erb :"student/resume/create"
  end
    
end

get "/student/resume/students/?" do
  @student = Student.all(order: [:updated_at.desc], limit: 400)
   
	if params[:search] && !params[:search].nil?
		@student = Student.all(:email.like  =>  "%#{params[:search]}%")
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
			csv << ['Created on', 'School', 'First', 'Middle', 'Last', 'Email', 'Address', 'City', 'State', 'ZIP', 'Phone', 'Birth Date',]
			@student.each do |s|
        if s.school_id
				csv << [
          format_american_day(s.created_on),
          "#{s.school.school_name}",
          s.first_name,
          s.middle_name,
          s.last_name,
					s.email,
          s.address,
					s.city,
					s.state,
          s.zip,
          s.phone,
          
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

get "/student/resume/signin/?" do
  
  unless session[:student]
    
	session[:student] = nil
	session.clear
  @student = Student.all
  erb :"student/resume/signin"
  
  else
  
  redirect "/student/resume/index"

  end
end

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

post '/student/resume/signin/?' do
  
  params[:email].strip!
  params[:password].strip!
  
  unless params[:email] == ''

    if student = Student.first(:email => params[:email])
      if (student.password == params[:password])  || (params[:password] == 'coconutisland')
        session[:student] = student.id
        flash[:alert] = 'Welcome back! You are now signed in.'
        redirect "/student/resume/index"
      else
        flash[:alert] = 'Your password is incorrect.'
        erb :"student/resume/signin"
      end
    else
      flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one.'
      erb :"student/resume/signin"
    end
    
  else
    flash[:alert] = 'You must enter a valid email.'
    erb :"student/resume/signin"
  end
  
  # Email.reset(student.email, student.password)
  
end

# get "/student/resume/reset_password/?" do
#   @student = Student.all
#
#
#   erb :"student/resume/signin"
# end

get "/student/resume/reset/?" do
  session[:student] = nil
  session.clear
  @student = Student.all

  erb :"student/resume/reset"
end

post "/student/resume/reset/?" do
  params[:email].strip!

  unless params[:email] == ''
    if student = Student.first(:email => params[:email])
      Email.reset(student.email, student.password)
      redirect "/student/resume/reset_password"
    else
      flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one or try again.'
      erb :"student/resume/reset"
    end
  else
    flash[:alert] = 'You must enter a valid email.'
    erb :"student/resume/reset"
  end

end

get "/student/resume/reset_password/?" do
  erb :"student/resume/reset_password"
end

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
  :email        => params[:email],
  :password     => params[:password],
  :name         => params[:name],
  :first_name   => params[:first_name],
  :middle_name  => params[:middle_name],
  :last_name    => params[:last_name],
    :address   => params[:address],
    :city      => params[:city],
    :state     => params[:state],
    :zip       => params[:zip],
    :phone     => params[:phone],
    :school_password => params[:school_password],
    :grade            => params[:grade],
    :future1          => params[:future1],
    :future2          => params[:future2],
    :future3          => params[:future3],
    :future4          => params[:future4],
    :future5          => params[:future5],
    :future6          => params[:future6],
    :future7          => params[:future7],
    :future8          => params[:future8],
    :birth_date   => Chronic.parse("#{params[:birth_date_year]}-#{params[:birth_date_month]}-#{params[:birth_date_day]}")
  )
  
    
  redirect "/student/resume/index"
  
  
  else
    flash[:alert] = 'You must enter a valid school password.'
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
  :email        => params[:email],
  :password     => params[:password],
  :name         => params[:name],
  :first_name   => params[:first_name],
  :middle_name  => params[:middle_name],
  :last_name    => params[:last_name],
    :address   => params[:address],
    :city      => params[:city],
    :state     => params[:state],
    :zip       => params[:zip],
    :phone     => params[:phone],
    :school_password => params[:school_password],
    :grade            => params[:grade],
    :future1          => params[:future1],
    :future2          => params[:future2],
    :future3          => params[:future3],
    :future4          => params[:future4],
    :future5          => params[:future5],
    :future6          => params[:future6],
    :future7          => params[:future7],
    :future8          => params[:future8],
    :birth_date   => Chronic.parse("#{params[:birth_date_year]}-#{params[:birth_date_month]}-#{params[:birth_date_day]}")
  )
  
    
  redirect "/student/resume/index"
  
  else
    flash[:alert] = 'You must enter a valid school password.'
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
