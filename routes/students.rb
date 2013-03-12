namespace '/student' do

  ['/resume/?', '/resources/?'].each do |path|
    before(path) { authenticate :student }
  end

  post '/create-account/?' do
    params[:email].strip!
    params[:email].downcase!
    params[:password].strip!
    params[:password].downcase!
    params[:school_password].strip!
    params[:school_password].downcase!

    @errors << :email_in_use if User.all(email: params[:email]).count > 0

    if @errors.count == 0
      student = User.create(email: params[:email], password: params[:password])
      session[:student] = student.id
      flash[:alert] = 'You are now signed in.'
      redirect '/student/student'
    else
      flash[:alert] = 'There was an error creating your account. Please try again.'
      erb :'student/create-account'
    end
  end

  post '/sign-in/?' do
    params[:email].strip!
    params[:email].downcase!
    params[:password].strip!
    params[:password].downcase!

    @errors << :email_not_found unless @user = User.first(email: params[:email])
    @errors << :password_not_matched unless @user && @user.password == params[:password]

    if @errors.count == 0
      session[:student] = @user.id
      flash[:alert] = 'You are now signed in.'
      redirect '/resume_tool/'
    else
      flash[:alert] = 'There was an error signing in. Please try again.'
      erb :'student/sign-in'
    end
  end

  get '/sign-out/?' do
    session[:student] = nil
    flash[:alert] = 'Thank you, come again!'
    redirect 'student/sign-in'
  end

end
