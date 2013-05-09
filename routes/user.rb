get '/users/?' do
	@user = User.all
	erb :users
end

get '/users/new/?' do
  @user = User.new
  erb :edit_user
end

post '/users/new/?' do
  user = User.create(
    :email      => params[:email],
    :password   => params[:password]
  )
  redirect '/users'
end

get '/users/:id/?' do
  @user = User.get(params[:id])
  erb :user
end

get '/users/:id/edit/?' do
  @user = User.get(params[:id])
  erb :edit_user
end

post '/users/:id/edit/?' do
  user = User.get(params[:id])
  user.update(
    :email  => params[:email],
    :password  => params[:password]
  )
  redirect "/users/#{params[:id]}/resume_tool"
end

get '/users/:id/delete/?' do
  user = User.get(params[:id])
  user.destroy
  redirect '/users'
end

get '/users/:id/resume_tool/?' do
  @user = User.get(params[:id])
  erb :resume_tool
end

get '/users/:id/contacts/:id/edit_contact/?' do
  @user = User.get(params[:id])
  erb :edit_contact
end

post '/arng/arng/?' do
  if (params[:password].strip.downcase == 'cdgaurd') || (params[:email].strip.downcase.include?('mil'))
    session[:cdgaurd] = true
    redirect '/arng/schools/340/edit'
  else
    flash[:alert] = 'Bad Login. Try Again.'
    redirect '/arng/arng'
  end
end

helpers do

  # Using auth_cdgaurd:
  #
  # get 'your/route/here/?' do
  #   auth_cdgaurd
  #   ...do stuff...
  #   erb :'your/route/view'
  # end

  def auth_cdgaurd
    unless session[:cdgaurd] == true
      flash[:alert] = 'You must login to see that page.'
      redirect '/arng/arng'
    end
  end
  
end