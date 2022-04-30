helpers do

  # Public: Redirects users to sign in pages unless they're already signed in.
  #
  # role - Symbol of the role to authenticate, such as :student or :rrc
  #
  # Returns nothing.


  def auth_recruiter
    unless session[:recruiter] == true || session[:admin] == true || session[:recruiter] != ''
      flash[:alert] = 'You must sign in to see that page.'
      redirect '/arng/arng'
    end
  end
  
  def auth_admin
    unless session[:admin] != ''
      flash[:alert] = 'You must be an admin to see that page.'
      redirect '/index'
    end
  end
  
  def auth_student
    unless session[:student] == true || session[:admin] == true || session[:recruiter] == true || session[:recruiter] != ''
      flash[:alert] = 'You must sign in to see that page.'
      redirect 'student/resume/signin'
    end
  end

end

