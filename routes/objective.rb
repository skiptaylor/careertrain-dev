get '/objectives/?' do
	@objective = Objective.all
	erb :objectives
end

get '/objectives/new/?' do
  @objective = Objective.new
  erb :edit_objective
end

post '/objectives/new/?' do
  objective = Objective.create(
    :id_user    => params[:id_user],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect '/objectives'
end

get '/objectives/:id/?' do
  @objective = Objective.get(params[:id])
  erb :objectives
end

get '/objectives/:id/edit/?' do
  @objective = Objective.get(params[:id])
  erb :edit_objective
end

post '/objectives/:id/edit/?' do
  objective = Objective.get(params[:id])
  objective.update(
    :id_user    => params[:id_user],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect '/objectives'
end

get '/objectives/:id/delete/?' do
  objective = Objective.get(params[:id])
  objective.destroy
  redirect '/objectives'
end
