get '/skills/?' do
	@skill = Skill.all
	erb :skills
end

get '/skills/new/?' do
  @skill = Skill.new
  erb :edit_skill
end

post '/skills/new/?' do
  user = User.get(session[:student])
  user.skill.create(
    :skill      => params[:skill],
    :applied_1  => params[:applied_1],
    :applied_2  => params[:applied_2],
    :applied_3  => params[:applied_3],
    :applied_4  => params[:applied_4]
    )
  redirect '/skills'
end

get '/skills/:id/?' do
  @skill = Skill.get(params[:id])
  erb :skills
end

get '/skills/:id/edit/?' do
  @skill = Skill.get(params[:id])
  erb :edit_skill
end

post '/skills/:id/edit/?' do
  skill = Skill.get(params[:id])
  skill.update(
    :skill      => params[:skill],
    :applied_1  => params[:applied_1],
    :applied_2  => params[:applied_2],
    :applied_3  => params[:applied_3],
    :applied_4  => params[:applied_4]
  )
  redirect '/skills'
end

get '/skills/:id/delete/?' do
  skill = Skill.get(params[:id])
  skill.destroy
  redirect '/skills'
end
