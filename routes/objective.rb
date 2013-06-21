get '/objectives/?' do
	@objective = Objective.all
	erb :'/resume/objectives/edit'
end

get '/objectives/new/?' do
  @objective = Objective.new
  :'/resume/objectives/edit'
end

post '/objectives/new/?' do
  objective = Objective.create(
    :id_user    => params[:id_user],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect '/resume/objectives/edit'
end

get '/objectives/:id/?' do
  @objective = Objective.get(params[:id])
  erb :'/resume/objectives/edit'
end

get '/resume/objectives/:id/edit/?' do
  @objective = Objective.get(params[:id])
  erb :'/resume/objectives/edit'
end

post '/resume/objectives/:id/edit/?' do
  objective = Objective.get(params[:id])
  objective.update(
    :id_user    => params[:id_user],
    :goal       => params[:goal],
    :learn      => params[:learn],
    :long_goal  => params[:long_goal]
  )
  redirect '/resume/objectives/edit'
end

get '/objectives/:id/delete/?' do
  objective = Objective.get(params[:id])
  objective.destroy
  redirect '/resume/objectives/edit'
end
