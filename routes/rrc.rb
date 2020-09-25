get '/rrcs/?' do
  auth_admin
  @state= State.all
	@rrcs = Rrc.all
	erb :rrcs
end

get '/rrcs/new/?' do
  auth_admin
  @state= State.all
  @rrc = Rrc.new
  erb :edit_rrc
end

post '/rrcs/new/?' do
  auth_admin
  state= State.all
  rrc = Rrc.create(
    :email  => params[:email],
    :state  => params[:state]
  )
  redirect '/rrcs'
end

get '/rrcs/:id/?' do
  auth_admin
  @state= State.all
  @rrc = Rrc.get(params[:id])
  erb :rrc
end

get '/rrcs/:id/edit/?' do
  auth_admin
  @state= State.all
  @rrc = Rrc.get(params[:id])
  erb :edit_rrc
end

post '/rrcs/:id/edit/?' do
  auth_admin
  state= State.all
  rrc = Rrc.get(params[:id])
  rrc.update(
    :email  => params[:email],
    :state  => params[:state]
  )
  redirect '/rrcs'
end

get '/rrcs/:id/delete/?' do
  auth_admin
  rrc = Rrc.get(params[:id])
  rrc.destroy
  redirect '/rrcs'
end