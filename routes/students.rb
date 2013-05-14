namespace '/student' do

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


