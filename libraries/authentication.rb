helpers do

  # Public: Redirects users to sign in pages unless they're already signed in.
  #
  # role - Symbol of the role to authenticate, such as :student or :rrc
  #
  # Returns nothing.
  def authenticate(role)

    case role

    when :student
      unless session[role]
        flash[:alert] = 'You must sign in to see that page.'
        redirect 'student/sign-in'
      end
    end

  end

end
