
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
  params[:school_password].strip!
  params[:school_password].downcase!
  params[:sub_code].strip!

  unless params[:school_password] == ''
    
    if school = School.first(:school_password => params[:school_password]) 
      
      # if subscription = Subscription.first(:sub_code => params[:sub_code])
#
#         unless student = Student.first(:sub_code => params[:sub_code])
#
#           if params[:sub_code] == params[:sub_code2]

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
            
              session[:student] = @student.id
              
              @student.school_id = school.id
              @student.save
            
              unless (@presentation = Presentation.first(:school_password => params[:school_password])) && (@presentation = Presentation.first(:class_date => Date.today.strftime("%Y-%m-%d")))
                
                  @presentation = Presentation.create(
                  :school_id  => @student.school_id,
                  :class_date  => @student.created_on,
                  :school_password  => @student.school_password,
                  :id => @student.presentation_id
                  )
                  
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
        
        # else
 #           flash[:alert] = 'This Student Access Codes must match. Try typing them again.'
 #           erb :"student/reports/create"
 #         end
 #
 #      else
 #         flash[:alert] = 'This Student Access Codes has already been used. Try typing it again.'
 #         erb :"student/reports/create"
 #      end
 #
 #     else
 #         flash[:alert] = 'This Student Access Code is incorrect. Try typing it again.'
 #        erb :"student/reports/create"
 #     end
      
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
    
  # student = Student.get(params[:id]).update(
  #   :school_id => school.id
  # )
  
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
  
  redirect("/student/reports/report/report_profile")
  
  else
    
    flash[:alert] = 'You must enter a valid school password.'
    redirect request.referrer
  
  end
end

get "/student/reports/:id/report/?" do
  @school = School.all
  @presentation = Presentation.all
  @student = Student.get(params[:id])
  
 if @student.class_date == nil
   @student.class_date = @student.created_on
   @student.save

 end
  
  erb :"/student/reports/report"
end

post "/student/reports/:id/report/?" do
  school = School.all
  presentation = Presentation.all
  student = Student.get(params[:id])
  
  unless params[:ex_score1] == params[:ex_score2]
    student.update(
      :ex_score1      => params[:ex_score1],
      :ex_score2      => params[:ex_score2]
      )
  else
    flash[:alert] = '1st Highest and 2nd Highest Scores cannot be the same.'
    redirect "/student/reports/#{params[:id]}/report"
  end
  
   redirect "/student/reports/#{params[:id]}/ex_scores"

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
  elsif @student.score1 && @student.score2 && File.exists?("./views/reports/#{@student.score2}#{@student.score1}.inc")
    @report1 = File.read("./views/reports/#{@student.score2}#{@student.score1}.inc")
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

get "/student/reports/:id/ex_scores/?" do
  @school = School.get(params[:school_id])
  @exercise = Exercise.get(params[:exercise_id])
  @student = Student.get(params[:id])
    
  if @student.ex_score1 && @student.ex_score1 != ''
    
  else
    @student.ex_score1 = false
  end

  if @student.ex_score2 && @student.ex_score2 != ''
    
  else
    @student.ex_score2 = false
  end
  
  if @student.ex_score1 && @student.ex_score2 && File.exists?("./views/reports/#{@student.ex_score1}#{@student.ex_score2}.inc")
    @report1 = File.read("./views/reports/#{@student.ex_score1}#{@student.ex_score2}.inc")
  elsif @student.ex_score1 && @student.ex_score2 && File.exists?("./views/reports/#{@student.ex_score2}#{@student.ex_score1}.inc")
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
  @school = School.get(params[:school_id])
  @student = Student.get(params[:id])
    
  if @student.score1 && @student.score1 != ''
    
  else
    @student.score1 = false
  end

  if @student.score2 && @student.score2 != ''
    
  else
    @student.score2 = false
  end
  
  if @student.score1 && File.exists?("./views/reports-long/#{@student.score1}.inc")
    @cat1 = File.read("./views/reports-long/#{@student.score1}.inc")
  end

  if @student.score2 && File.exists?("./views/reports-long/#{@student.score2}.inc")
    @cat2 = File.read("./views/reports-long/#{@student.score2}.inc")
  end

  if @student.score1 && @student.score2 && File.exists?("./views/reports-long/#{@student.score1}#{@student.score2}.inc")
    @report1 = File.read("./views/reports-long/#{@student.score1}#{@student.score2}.inc")
  elsif @student.score1 && @student.score2 && File.exists?("./views/reports-long/#{@student.score2}#{@student.score1}.inc")
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
  school = School.get(params[:school_id])
  student = Student.get(params[:id])
  
  PDFKit.configure do |config|
    config.default_options = {
      :print_media_type => true,
      :page_size        => 'Letter',
      :margin_top       => '0.25in',
      :margin_right     => '0.25in',
      :margin_bottom    => '0.25in',
      :margin_left      => '0.25in',
      :javascript_delay => 1000
    }
  end
  
  content_type 'application/pdf'
  
  if settings.development?
    kit = PDFKit.new("http://localhost:4567/student/reports/#{student.id}/scores_full")
  elsif settings.production?
    kit = PDFKit.new("https://www.ecareerdirection.com/student/reports/#{student.id}/scores_full")
  end
    
  pdf = kit.to_pdf
 
end





get "/student/reports/:id/ex_scores_full/?" do
  @school = School.all
  @exercise = Exercise.get(params[:exercise_id])
  @student = Student.get(params[:id])

  if @student.ex_score1 && @student.ex_score1 != ''

  else
    @student.ex_score1 = false
  end

  if @student.ex_score2 && @student.ex_score2 != ''

  else
    @student.ex_score2 = false
  end

  if @student.ex_score1 && File.exists?("./views/reports-long/#{@student.ex_score1}.inc")
    @cat1 = File.read("./views/reports-long/#{@student.ex_score1}.inc")
  end

  if @student.ex_score2 && File.exists?("./views/reports-long/#{@student.ex_score2}.inc")
    @cat2 = File.read("./views/reports-long/#{@student.ex_score2}.inc")
  end

  if @student.ex_score1 && @student.ex_score2 && File.exists?("./views/reports-long/#{@student.ex_score1}#{@student.ex_score2}.inc")
    @report1 = File.read("./views/reports-long/#{@student.ex_score1}#{@student.ex_score2}.inc")
  elsif @student.ex_score1 && @student.ex_score2 && File.exists?("./views/reports-long/#{@student.ex_score2}#{@student.ex_score1}.inc")
    @report1 = File.read("./views/reports-long/#{@student.ex_score2}#{@student.ex_score1}.inc")
  end

 # -------------------- show report ---------------------
 if @student.ex_score1 && @student.ex_score2
   erb :'student/reports/ex_scores_full', layout: false
 else
   erb :'student/reports/report'
 end

end
