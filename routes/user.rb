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
  redirect '/users'
end

get '/users/:id/delete/?' do
  user = User.get(params[:id])
  user.destroy
  redirect '/users'
end