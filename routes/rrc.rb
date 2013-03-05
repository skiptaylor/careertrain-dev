get '/rrcs/?' do
	@rrcs = Rrc.all
	erb :rrcs
end

get '/rrcs/new/?' do
  @rrc = Rrc.new
  erb :edit_rrc
end

post '/rrcs/new/?' do
  rrc = Rrc.create(
    :email  => params[:email],
    :state  => params[:state]
  )
  redirect '/rrcs'
end

get '/rrcs/:id/?' do
  @rrc = Rrc.get(params[:id])
  erb :rrc
end

get '/rrcs/:id/edit/?' do
  @rrc = Rrc.get(params[:id])
  erb :edit_rrc
end

post '/rrcs/:id/edit/?' do
  rrc = Rrc.get(params[:id])
  rrc.update(
    :email  => params[:email],
    :state  => params[:state]
  )
  redirect '/rrcs'
end

get '/rrcs/:id/delete/?' do
  rrc = Rrc.get(params[:id])
  rrc.destroy
  redirect '/rrcs'
end