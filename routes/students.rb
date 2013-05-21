namespace '/student' do

  get "/report/?" do
    erb :'student/report'
  end

  post "/report/?" do
    if school = Client.first(school_password: params[:password].downcase.strip)
      redirect("student/report/#{school.school_password}")
    else
      flash[:alert] = "School could not be found."
      erb :'student/report'
    end
  end
  
  get "/report/:school_password/?" do
    @school = Client.first(school_password: params[:school_password])
    
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

  get "/resume/create/?" do 
    erb :'student/resume/create'
  end

  post '/resume/create/?' do
    params[:email].strip!
    params[:email].downcase!
    params[:password].strip!
    params[:password].downcase!
    # params[:school_password].strip!
#     params[:school_password].downcase!

    @errors << :email_in_use if User.all(email: params[:email]).count > 0

    if @errors.count == 0
      student = User.create(email: params[:email], password: params[:password])
      session[:student] = student.id
      flash[:alert] = 'You are now signed in.'
      redirect '/student/resume/index'
    else
      flash[:alert] = 'There was an error creating your account. Please try again.'
      erb :'/student/resume_tool'
    end
  end
  
  get "/resume/signin/?" do 
    erb :"student/resume/signin"
  end

  post '/resume/signin/?' do
    params[:email].strip!
    params[:email].downcase!
    params[:password].strip!
    params[:password].downcase!

    @errors << :email_not_found unless @user = User.first(email: params[:email])
    @errors << :password_not_matched unless @user && @user.password == params[:password]

    if @errors.count == 0
      session[:student] = @user.id
      flash[:alert] = 'You are now signed in.'
      redirect "/student/resume/index"
    else
      flash[:alert] = 'There was an error signing in. Please try again.'
      erb :"student/resume/signin"
    end
  end

  get "/resume/sign-out/?" do
    session[:student] = nil
    flash[:alert] = 'Thank you, come again!'
    redirect "/student/student"
  end
  
  get "/resume/index/?" do
     @user = User.get(params[:id])
    erb :"/student/resume/index"
  end

end


