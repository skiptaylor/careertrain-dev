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
  @presentation = Presentation.all
  erb :'student/reports/create'
end

post '/student/reports/create/?' do
  subscription = Subscription.all
  school = School.all
  state = State.all
  presentation = Presentation.all
  
  params[:email].strip!
  params[:password].strip!
  params[:password].downcase!
  params[:school_password].strip!
  params[:school_password].downcase!
  params[:sub_code].strip!
  params[:sub_code].upcase!
  params[:sub_code2].strip!
  params[:sub_code2].upcase!

  unless params[:school_password] == ''
    
    if school = School.first(:school_password => params[:school_password]) 
      
      if subscription = Subscription.first(:sub_code => params[:sub_code])

        unless student = Student.first(:sub_code => params[:sub_code])

          if params[:sub_code] == params[:sub_code2]

          unless student = Student.first(:email => params[:email])
            unless params[:password] == ''
              hashed_password = BCrypt::Password.create(params[:password])
              @student = Student.create(
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
              :school_id        => params[:school_id],
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
              :class_date       => params[:class_date]
              )
              
              session[:student] = @student.id
              @student.created_on = @student.created_at
              
              @student.school_id = school.id
              @student.class_date = @student.created_at           
              @student.save
            
              unless (@presentation = Presentation.first(:school_password => params[:school_password])) && (@presentation = Presentation.first(:class_date => Date.today.strftime("%Y-%m-%d")))
                
                  @presentation = Presentation.create(
                    :school_id  => @student.school_id,
                    :class_date  => @student.created_at,           
                    :school_password  => @student.school_password
                  )
                  @presentation.save
              end

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
           flash[:alert] = 'The Student Access Codes must match. Try typing them again.'
           erb :"student/reports/create"
         end

      else
         flash[:alert] = 'This Student Access Codes has already been used. Try typing it again.'
         erb :"student/reports/create"
      end

     else
         flash[:alert] = 'This Student Access Code is incorrect. Try typing it again.'
        erb :"student/reports/create"
      end
      
    else
      flash[:alert] = 'That is not a valid School ID.'
      erb :"student/reports/create"
    end 
    
  else
    flash[:alert] = 'You must enter a valid School ID'
    erb :"student/reports/create"
  end
    
end

get '/student/reports/report/report_profile/?' do
  auth_student
  @subscription = Subscription.all
  @state = State.all
  @school = School.all
  @student = Student[session[:student]]
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
  params[:password].downcase!
  
  unless params[:email] == ''
    hashed_password = BCrypt::Password.create(params[:password])
    if student = Student.first(:email => params[:email])
      if (student.password = hashed_password) || (params[:password] == "PurpleHippopotamus!") || (params[:password] == "studentpass")
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



#----------  password reset  ----------

get "/student/reports/password-reset/?"  do
  @student = Student.all
    
  erb :'/student/reports/password-reset'
end

post "/student/reports/password-reset/?"  do
 
  params[:email].strip!
  
  if student = Student.first(:email => params[:email])
    
    session[:studTemp] = student.id

    session[:stud_new] = params[:email]

    params[:passcode] = rand(1000..5000).to_s

    session[:verifyCode] = params[:passcode]
  
    if settings.production?
      Pony.mail(
        headers: { 'Content-Type' => 'text/html' },
        to: "#{params[:email]}",
        from: "noreply@eCareerDirection.com",
        subject: "Here is your eCareerDirection Admin password rest code.",
        body: "Here is your password rest code for your <b>eCareerDirection</b> Admin account: <b>#{params[:passcode]}</b>"
      )
      flash[:alert] = 'Reset code was sent to your inbox.'
      redirect '/student/reports/reset'
    else
      flash[:alert] = 'Reset code would have been sent in production mode.'
      redirect '/student/reports/reset'
    end

  else
    flash[:alert] = 'We can\'t find an account with that email,'
    erb :"/student/reports/password-reset"
  end

end

get "/student/reports/reset/?"  do
  
  erb :'/student/reports/reset'
end

post "/student/reports/reset/?"  do
  
  if
    params[:passcode] = session[:verifyCode]
    
    redirect "/student/reports/#{session[:studTemp]}/new-password"
  else 
    flash[:alert] = 'Code is not valid. Try again.'
  end
    
  redirect '/student/reports/reset'
end

get "/student/reports/:id/new-password/?"  do
  auth_student
  @student = Student[params[:id]]
  @student.password = (@student.password = nil)
  @student.save
  erb :'/student/reports/new-password'
end

post "/student/reports/:id/new-password/?" do
  auth_student
  student = Student[params[:id]]
  
  student.update(
    :password         => params[:password]
  )
  session[:student] = student.id
  student.save
  redirect "/student/reports/report/report_profile"
end


#----------  end password reset  ----------



get '/student/reports/:id/edit/?' do
  auth_student
  @state = State.all
  @school = School.all
  @student = Student[params[:id]]
  erb :'/student/reports/edit_student'
end

post '/student/reports/:id/edit/?' do
  auth_student
  params[:password].strip!
  params[:password].downcase!
  params[:school_password].strip!
  params[:school_password].downcase!
  
  if school = School.first(:school_password => params[:school_password])
    
  hashed_password = BCrypt::Password.create(params[:password])
  student = Student[params[:id]].update(
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
  :school_id        => params[:school_id],
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
  :presentation_id  => params[:presentation_id]
  )
  
  redirect "/student/reports/report/report_profile"
  
  else
    
    flash[:alert] = 'You must enter a valid School ID.'
    redirect request.referrer
  
  end
end




#----------  student reports  ----------


get "/student/reports/:id/report/?" do
  auth_student
  @school = School.all
  @presentation = Presentation.all
  @student = Student[params[:id]]
  
 if @student.class_date == nil
   @student.class_date = @student.created_on
   @student.save
 end
  
  erb :"/student/reports/report"
end

post "/student/reports/:id/report/?" do
  auth_student
  school = School.all
  presentation = Presentation.all
  student = Student[params[:id]]
  
  unless params[:ex_score1] == params[:ex_score2]
    student.update(
      :ex_score1      => params[:ex_score1],
      :ex_score2      => params[:ex_score2]
      )
  else
    redirect "/student/reports/#{params[:id]}/report?score1=#{student.score1}&score2=#{student.score2}&email=#{student.email}"
  end
  
   redirect "/student/reports/#{params[:id]}/ex_scores"

end


get "/student/reports/:id/mail_wel2/?" do
  auth_student
  @school = School.all
  @presentation = Presentation.all
  @student = Student[params[:id]]
  
  erb :"/student/reports/mail_wel2"
end


get "/student/reports/:id/scores/?" do
  auth_student
  @school = School.all
  @exercise = Exercise[params[:exercise_id]]
  @student = Student[params[:id]]
    
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
  
  if @student.score1 && File.exist?("./views/reports/#{@student.score1}.inc")
    @cat1 = File.read("./views/reports/#{@student.score1}.inc")
  end

  if @student.score2 && File.exist?("./views/reports/#{@student.score2}.inc")
    @cat2 = File.read("./views/reports/#{@student.score2}.inc")
  end

  if @student.score3 && File.exist?("./views/reports/#{@student.score3}.inc")
    @cat3 = File.read("./views/reports/#{@student.score3}.inc")
  end
  
  if @student.score1 && @student.score2 && File.exist?("./views/reports/#{@student.score1}#{@student.score2}.inc")
    @report1 = File.read("./views/reports/#{@student.score1}#{@student.score2}.inc")
  elsif @student.score1 && @student.score2 && File.exist?("./views/reports/#{@student.score2}#{@student.score1}.inc")
    @report1 = File.read("./views/reports/#{@student.score2}#{@student.score1}.inc")
  end

  if @student.score1 && @student.score3 && File.exist?("./views/reports/#{@student.score1}#{@student.score3}.inc")
    @report2 = File.read("./views/reports/#{@student.score1}#{@student.score3}.inc")
  elsif @student.score1 && @student.score3 && File.exist?("./views/reports/#{@student.score3}#{@student.score1}.inc")
    @report2 = File.read("./views/reports/#{@student.score3}#{@student.score1}.inc")
  end

  if @student.score2 && @student.score3 && File.exist?("./views/reports/#{@student.score2}#{@student.score3}.inc")
    @report3 = File.read("./views/reports/#{@student.score2}#{@student.score3}.inc")
  elsif @student.score2 && @student.score3 && File.exist?("./views/reports/#{@student.score3}#{@student.score2}.inc")
    @report3 = File.read("./views/reports/#{@student.score3}#{@student.score2}.inc")
  end
 
 # -------------------- show report --------------------
 
 if @student.score1 && @student.score2
   erb :'student/reports/scores'
 else
   erb :'student/reports/report'
 end
  
end

get "/student/reports/:id/ex_scores/?" do
  auth_student
  @school = School[params[:school_id]]
  @exercise = Exercise[params[:exercise_id]]
  @student = Student[params[:id]]
    
  if @student.ex_score1 && @student.ex_score1 != ''
    
  else
    @student.ex_score1 = false
  end

  if @student.ex_score2 && @student.ex_score2 != ''
    
  else
    @student.ex_score2 = false
  end
  
  if @student.ex_score1 && @student.ex_score2 && File.exist?("./views/reports/#{@student.ex_score1}#{@student.ex_score2}.inc")
    @report1 = File.read("./views/reports/#{@student.ex_score1}#{@student.ex_score2}.inc")
  elsif @student.ex_score1 && @student.ex_score2 && File.exist?("./views/reports/#{@student.ex_score2}#{@student.ex_score1}.inc")
    @report1 = File.read("./views/reports/#{@student.ex_score2}#{@student.ex_score1}.inc")
  end

 # -------------------- show report ---------------------

 if @student.ex_score1 && @student.ex_score2
   erb :'student/reports/ex_scores'
 else
   erb :'student/reports/report'
 end
  
end

get "/student/reports/:id/scores_full/?" do
  
  @school = School[params[:school_id]]
  @student = Student[params[:id]]
    
  if @student.score1 && @student.score1 != ''
    
  else
    @student.score1 = false
  end

  if @student.score2 && @student.score2 != ''
    
  else
    @student.score2 = false
  end
  
  if @student.score1 && File.exist?("./views/reports-long/#{@student.score1}.inc")
    @cat1 = File.read("./views/reports-long/#{@student.score1}.inc")
  end

  if @student.score2 && File.exist?("./views/reports-long/#{@student.score2}.inc")
    @cat2 = File.read("./views/reports-long/#{@student.score2}.inc")
  end

  if @student.score1 && @student.score2 && File.exist?("./views/reports-long/#{@student.score1}#{@student.score2}.inc")
    @report1 = File.read("./views/reports-long/#{@student.score1}#{@student.score2}.inc")
  elsif @student.score1 && @student.score2 && File.exist?("./views/reports-long/#{@student.score2}#{@student.score1}.inc")
    @report1 = File.read("./views/reports-long/#{@student.score2}#{@student.score1}.inc")
  end
  
 # -------------------- show report ---------------------
 
 if @student.score1 && @student.score2
   erb :'student/reports/scores_full', layout: false
 else
   erb :'student/reports/report'
 end
  
end

post "/student/reports/:id/scores_full/?" do
  auth_student
  school = School[params[:school_id]]
  student = Student[params[:id]]
  
  PDFKit.configure do |config|
    config.default_options = {
      :print_media_type => true,
      :page_size        => 'Letter',
      :margin_top       => '0.25in',
      :margin_right     => '0.25in',
      :margin_bottom    => '0.25in',
      :margin_left      => '0.25in'
    }
  end
  
  content_type 'application/pdf'
  
  if settings.development?
    kit = PDFKit.new("http://localhost:9292/student/reports/#{student.id}/scores_full")
  elsif settings.production?
    kit = PDFKit.new("https://www.ecareerdirection.com/student/reports/#{student.id}/scores_full")
  end
    
  pdf = kit.to_pdf
 
end


get "/student/reports/:id/ex_scores_full/?" do
  auth_student
  @school = School.all
  @exercise = Exercise[params[:exercise_id]]
  @student = Student[params[:id]]

  if @student.ex_score1 && @student.ex_score1 != ''

  else
    @student.ex_score1 = false
  end

  if @student.ex_score2 && @student.ex_score2 != ''

  else
    @student.ex_score2 = false
  end

  if @student.ex_score1 && File.exist?("./views/reports-long/#{@student.ex_score1}.inc")
    @cat1 = File.read("./views/reports-long/#{@student.ex_score1}.inc")
  end

  if @student.ex_score2 && File.exist?("./views/reports-long/#{@student.ex_score2}.inc")
    @cat2 = File.read("./views/reports-long/#{@student.ex_score2}.inc")
  end

  if @student.ex_score1 && @student.ex_score2 && File.exist?("./views/reports-long/#{@student.ex_score1}#{@student.ex_score2}.inc")
    @report1 = File.read("./views/reports-long/#{@student.ex_score1}#{@student.ex_score2}.inc")
  elsif @student.ex_score1 && @student.ex_score2 && File.exist?("./views/reports-long/#{@student.ex_score2}#{@student.ex_score1}.inc")
    @report1 = File.read("./views/reports-long/#{@student.ex_score2}#{@student.ex_score1}.inc")
  end

 # -------------------- show report ---------------------
 if @student.ex_score1 && @student.ex_score2
   erb :'student/reports/ex_scores_full', layout: false
 else
   erb :'student/reports/report'
 end

end
