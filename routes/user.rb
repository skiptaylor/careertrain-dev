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
    :email     => params[:email],
    :password  => params[:password],
    :name      => params[:name],
    :address   => params[:address],
    :city      => params[:city],
    :state     => params[:state],
    :zip       => params[:zip],
    :phone     => params[:phone],
    :email     => params[:email]
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
    :email     => params[:email],
    :password  => params[:password],
    :name      => params[:name],
    :address   => params[:address],
    :city      => params[:city],
    :state     => params[:state],
    :zip       => params[:zip],
    :phone     => params[:phone],
    :email     => params[:email]
  )
  redirect "/users/#{params[:id]}"
end

get '/users/:id/delete/?' do
  user = User.get(params[:id])
  user.destroy
  redirect '/users'
end

get '/users/:id/resume/index/?' do
  @user = User.get(params[:id])
  erb :"/resume/index"
end

get '/users/student/resume/signin/?' do
  @user = User.get(params[:id])
  erb :index
end
