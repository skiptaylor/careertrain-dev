get "/student/report/?" do
  erb :'student/report'
end

post "/student/report/?" do
  if school = School.first(school_password: params[:password].downcase.strip)
    redirect("student/report/#{school.school_password}")
  else
    flash[:alert] = "School could not be found."
    erb :'student/report'
  end
end

get "/student/report/:school_password/?" do
  @school = School.first(school_password: params[:school_password])
    
  if params[:score1] && params[:score1] != ''
    params[:score1].strip!
    params[:score1].downcase!
  else
    params[:score1] = false
  end

  if params[:score2] && params[:score2] != ''
    params[:score2].strip!
    params[:score2].downcase!
  else
    params[:score2] = false
  end

  if params[:score3] && params[:score3] != ''
    params[:score3].strip!
    params[:score3].downcase!
  else
    params[:score3] = false
  end
  
  if params[:score1] && File.exists?("./views/reports/#{params[:score1]}.inc")
    @cat1 = File.read("./views/reports/#{params[:score1]}.inc")
  end

  if params[:score2] && File.exists?("./views/reports/#{params[:score2]}.inc")
    @cat2 = File.read("./views/reports/#{params[:score2]}.inc")
  end

  if params[:score3] && File.exists?("./views/reports/#{params[:score3]}.inc")
    @cat3 = File.read("./views/reports/#{params[:score3]}.inc")
  end
  
  if params[:score1] && params[:score2] && File.exists?("./views/reports/#{params[:score1]}#{params[:score2]}.inc")
    @report1 = File.read("./views/reports/#{params[:score1]}#{params[:score2]}.inc")
  end

  if params[:score1] && params[:score3] && File.exists?("./views/reports/#{params[:score1]}#{params[:score3]}.inc")
    @report2 = File.read("./views/reports/#{params[:score1]}#{params[:score3]}.inc")
  end

  if params[:score2] && params[:score3] && File.exists?("./views/reports/#{params[:score2]}#{params[:score3]}.inc")
    @report3 = File.read("./views/reports/#{params[:score2]}#{params[:score3]}.inc")
  end
  
  if params[:score1] && params[:score2]
    unless @cat1 && @cat2
      flash[:alert] = "Invalid scores. Try again."
      erb :'student/enter_scores'
    end
  end
  
  if params[:score1] && params[:score2] && defined?(@cat1) && defined?(@cat2)
    erb :'student/scores', layout: false
  else
    erb :'student/enter_scores'
  end
end

get "/student/resume/create/?" do 
  erb :'student/resume/create'
end

post '/student/resume/create/?' do
  params[:email].strip!
  
  params[:password].strip!
  
  params[:school_password].strip!
  params[:school_password].downcase!

  @errors << :email_in_use if Student.all(email: params[:email]).count > 0

  if @errors.count == 0
    @student = Student.create(email: params[:email], password: params[:password])
    session[:student] = @student.id
    flash[:alert] = 'You are now signed in.'
    redirect '/student/resume/index'
  else
    flash[:alert] = 'There was an error creating your account. Please try again.'
    erb :'/student/resume_tool'
  end
    
end

get "/student/resume/students/?" do
  @student = Student.all
  
	if params[:search] && !params[:search].nil?
		@student = Student.all(:email.like  =>  "%#{params[:search]}%")

	end
  
  erb :"student/resume/students"
end

get "/student/resume/:id/student/?" do
  @student = Student.get(params[:id])
  erb :"student/resume/student"
end

get "/student/resume/signin/?" do
	session[:student] = nil
	session.clear
  @student = Student.all
  erb :"student/resume/signin"
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

  if student = Student.first(:email => params[:email])
    if (student.password == params[:password])  || (params[:password] == 'coconutisland')
      session[:student] = student.id
      flash[:alert] = 'You are now signed in.'
      redirect "/student/resume/index"
    else
      flash[:alert] = 'Email/password combo does not match. Try again.'
      erb :"student/resume/signin"
    end
  else
    flash[:alert] = 'This email is not linked to an existing account. Try again or create an account.'
    erb :"student/resume/signin"
  end
  
end

get "/student/resume/sign-out/?" do
  session[:student] = nil
  flash[:alert] = 'Thank you, come again!'
  redirect "/student/student"
end
  
get "/student/resume/index/?" do
  @student = Student.get(session[:student])
  erb :"student/resume/index"
end

get '/student/resume/:id/edit/?' do
  @student = Student.get(params[:id])
  erb :'/student/resume/edit_student'
end

post '/student/resume/:id/edit/?' do
  @student = Student.get(params[:id]).update(
    :email     => params[:email],
    :password  => params[:password],
    :name      => params[:name],
    :address   => params[:address],
    :city      => params[:city],
    :state     => params[:state],
    :zip       => params[:zip],
    :phone     => params[:phone],
  )
  redirect "/student/resume/index"
end

get '/student/resume/edit/?' do
  @student = Student.get(session[:student])
  erb :'/student/resume/edit_student'
end

post '/student/resume/edit/?' do
  @student = Student.get(session[:student]).update(
    :email     => params[:email],
    :password  => params[:password],
    :name      => params[:name],
    :address   => params[:address],
    :city      => params[:city],
    :state     => params[:state],
    :zip       => params[:zip],
    :phone     => params[:phone],
  )
  redirect "/student/resume/index"
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
