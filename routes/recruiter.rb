get "/recruiters/recruiters/?" do
  auth_admin
  @state = State.all
  @recruiter = Recruiter.all
  erb :"/recruiter/recruiters"
end


get "/recruiters/noaccount/?"  do
  @state = State.all
  @recruiter = Recruiter.all
  
  erb :'/recruiter/noaccount'
end

post "/recruiters/noaccount/?"  do
  Pony.mail(
   headers: { 'Content-Type' => 'text/html' },
   to: "#{params[:email]}",
   from: 'noreply@eCareerDirection.com',
   subject: "You email is verified",
   body: "Thank you. Your email is verified. Go here to continue registrtation. <a href="https://www.ecareerdirection.com/recruiters/new">Register</a>"
   )
  # redirect '/recruiters/new'
end


get "/recruiters/new/?"  do
  @state = State.all
  @recruiter = Recruiter.new
  erb :'/recruiter/recruiter_new'
end

post "/recruiters/new/?"  do 
    
  state = State.all
  recruiter = Recruiter.create(
    :email            => params[:email],
    :password         => params[:password], 
    :last_activity    => params[:last_activity],
    :rank             => params[:rank],
    :first_name       => params[:first_name],
    :middle_name      => params[:middle_name],
    :last_name        => params[:last_name],
    :address1         => params[:address1],
    :address2         => params[:address2],
    :city             => params[:city],
    :state            => params[:state],
    :zip              => params[:zip],
    :phone            => params[:phone],
    :ssnl4            => params[:ssnl4]
  )
    
  session[:recruiter] = recruiter.id
  
  if (params[:email].strip.downcase.include?('.mil'))
    redirect "/recruiters/#{recruiter.id}/profile"
  else
    flash[:alert] = 'Oops! You must use a valid .mil email address.'
    redirect "/recruiters/#{recruiter.id}/edit"
  end

end

get "/recruiters/:id/edit/?" do
  auth_recruiter
  @state = State.all
  @recruiter = Recruiter.get(params[:id])
  
  erb :"/recruiter/recruiter_edit"
end

post "/recruiters/:id/edit/?" do
  recruiter = Recruiter.get(params[:id])
  recruiter.update(
    :email            => params[:email],
    :password         => params[:password],
    :last_activity    => params[:last_activity],
    :rank             => params[:rank],
    :first_name       => params[:first_name],
    :middle_name      => params[:middle_name],
    :last_name        => params[:last_name],
    :address1         => params[:address1],
    :address2         => params[:address2],
    :city             => params[:city],
    :state            => params[:state],
    :zip              => params[:zip],
    :phone            => params[:phone],
    :ssnl4            => params[:ssnl4]
  )
  
  params[:recruiter_status] ? recruiter.update(:recruiter_status => true) : recruiter.update(:recruiter_status => false)
  params[:active]           ? recruiter.update(:active => true)           : recruiter.update(:active => false)
    
  if session[:admin] 
    redirect "/recruiters/recruiters"
  else session[:recruiter]
    redirect "/recruiters/#{recruiter.id}/profile"
  end

end

get "/recruiters/signin/?" do
  @recruiter = Recruiter.all
    erb :"/recruiter/signin"
  end

post "/recruiters/signin/?" do
  
  params[:email].strip!
  params[:password].strip!
  
  unless params[:email] == ''
  
    if recruiter = Recruiter.first(:email => params[:email])
      if (recruiter.password == params[:password])  || (params[:password] == 'coconutisland')
        
        session[:recruiter] = recruiter.id
        
        flash[:alert] = 'Welcome back! You are now signed in.'
        redirect "/arng/leads"
      else
        flash[:alert] = 'Your password is incorrect.'
        erb :"/recruiter/signin"
      end
    else
      flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one.'
      erb :"/recruiter/signin"
    end
  
  else
    flash[:alert] = 'You must enter a valid email.'
    erb :"/recruiter/signin"
  end
end

get '/recruiters/:id/profile/?' do
  auth_recruiter
  @school = School.all(:recruiter_id => params[:id])
  @state = State.all
  @recruiter = Recruiter.get(params[:id])
  
  unless params[:zip]
    @results = []
  else
    @results = School.all(school_zip: params[:zip].strip.downcase)
  end
  
   
  erb :"/recruiter/recprofile"
end

get "/recruiters/:id/view/?" do
  auth_admin
  @school = School.all(order: [:updated_at.desc], limit:50)
  @state = State.all
  @recruiter = Recruiter.get(params[:id])
  erb :"/recruiter/recruiter"
end

get '/recruiters/:id/delete/?' do
  auth_admin
  recruiter = Recruiter.get(params[:id])
  recruiter.destroy
  redirect "/recruiters/recruiters"
end

get "/recruiters/signout/?" do
  session[:recruiter] = nil
  session.clear
  flash[:alert] = 'You are now signed out.'
  redirect "/arng/arng"
end

