get '/student/resume/skills/?' do
  
  @student = Student.get(session[:student])
	@skill = Skill.all
	erb :skills
end

get '/student/resume/skills/new/?' do
  
  @student = Student.get(session[:student])
  @skill = Skill.new
  erb :'/student/resume/skills/edit'
end

post '/student/resume/skills/new/?' do
  
  skill = Skill.create(
    :student_id => session[:student],
    :skill      => params[:skill],
    :applied_1  => params[:applied_1],
    :applied_2  => params[:applied_2],
    :applied_3  => params[:applied_3],
    :applied_4  => params[:applied_4]
    )
  redirect '/student/resume/skills/skills'
end

get '/student/resume/skills/skills/?' do
  
  @student = Student.get(session[:student])
  @skill = Skill.get(params[:id])
  erb :'/student/resume/skills/skills'
end

get '/student/resume/skills/:id/view/?' do
  
  @student = Student.get(session[:student])
  @skill = Skill.get(params[:id])
  erb :'/student/resume/skills/view'
end

get '/student/resume/skills/:id/edit/?' do
  
  @student = Student.get(session[:student])
  @skill = Skill.get(params[:id])
  erb :'/student/resume/skills/edit'
end

post '/student/resume/skills/:id/edit/?' do
  
  @student = Student.get(session[:student])
  skill = Skill.get(params[:id])
  skill.update(
    :student_id => session[:student],
    :skill      => params[:skill],
    :applied_1  => params[:applied_1],
    :applied_2  => params[:applied_2],
    :applied_3  => params[:applied_3],
    :applied_4  => params[:applied_4]
  )
  redirect '/student/resume/skills/skills'
end

get '/student/resume/skills/:id/delete/?' do
  
  @student = Student.get(session[:student])
  skill = Skill.get(params[:id])
  skill.destroy
  redirect '/student/resume/skills/skills'
end
