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
  
  if params[:score1] && params[:score2] && params[:score3]
     params[:score1].strip!
     params[:score1].downcase!
     params[:score2].strip!
     params[:score2].downcase!
     params[:score3].strip!
     params[:score3].downcase!
    
  if File.exists?("./views/reports/#{params[:score1]}#{params[:score2]}.inc") &&
      File.exists?("./views/reports/#{params[:score1]}#{params[:score3]}.inc") &&
      File.exists?("./views/reports/#{params[:score2]}#{params[:score3]}.inc")
      @report1 = File.read("./views/reports/#{params[:score1]}#{params[:score2]}.inc")
      @report2 = File.read("./views/reports/#{params[:score1]}#{params[:score3]}.inc")
      @report3 = File.read("./views/reports/#{params[:score2]}#{params[:score3]}.inc")
      @cat1 = File.read("./views/reports/#{params[:score1]}.inc")
      @cat2 = File.read("./views/reports/#{params[:score2]}.inc")
      @cat3 = File.read("./views/reports/#{params[:score3]}.inc")
      erb :'student/scores', layout: false
    else
      flash[:alert] = "Invalid scores. Try again."
      erb :'student/enter_scores'
    end
  else
    erb :'student/enter_scores'
  end
end

get "/student/resume/create/?" do 
  erb :'student/resume/create'
end

post '/student/resume/create/?' do
  params[:email].strip!
  params[:email].downcase!
  params[:password].strip!
  params[:password].downcase!
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

get "/student/resume/signin/?" do 
  erb :"student/resume/signin"
end

post '/student/resume/signin/?' do
  params[:email].strip!
  params[:email].downcase!
  params[:password].strip!
  params[:password].downcase!

  @errors << :email_not_found unless @student = Student.first(email: params[:email])
  @errors << :password_not_matched unless @student && @student.password == params[:password]

  if @errors.count == 0
    session[:student] = @student.id
    flash[:alert] = 'You are now signed in.'
    redirect "/student/resume/index"
  else
    flash[:alert] = 'There was an error signing in. Please try again.'
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

# get '/student/:id/?' do
#   @student = Student.get(session[:student])
#   erb :'/student/student'
# end

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

# get '/student/:id/delete/?' do
#   @student = Student.get(params[:id])
#   student.destroy
#   redirect '/student'
# end

get '/student/resources/?'  do
  erb :'/student/resources'
end

get '/student/feedback/?'  do
  erb :'/student/feedback'
end

get '/student/resume_tool/?'  do
  erb :'/student/resume_tool'
end
