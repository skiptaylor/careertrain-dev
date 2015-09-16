get '/student/resume/traits/?' do
  
  @student = Student.get(session[:student])
	@trait = Trait.all
	erb :'/student/resume/traits/traits'
end

get '/student/resume/traits/new/?' do
  
  @student = Student.get(session[:student])
  @trait = Trait.new
  erb :"/student/resume/traits/edit"
end

post '/student/resume/traits/new/?' do
  
  trait = Trait.create(
    :student_id        => session[:student],
    :trait_1           => params[:trait_1],
    :trait_2           => params[:trait_2],
    :trait_3           => params[:trait_3],
  )
  redirect "/student/resume/traits/traits"
end

get '/student/resume/traits/traits/?' do
  
  @student = Student.get(session[:student])
	@trait = Trait.get(params[:id])
	erb :'/student/resume/traits/traits'
end

get '/student/resume/traits/:id/view?' do
  
  @student = Student.get(session[:student])
  @trait = Trait.get(params[:id])
  erb :'/student/resume/traits/view'
end

get '/student/resume/traits/:id/edit/?' do
  
  @student = Student.get(session[:student])
  @trait = Trait.get(params[:id])
  erb :'/student/resume/traits/edit'
end

post '/student/resume/traits/:id/edit/?' do
  
  @student = Student.get(session[:student])
  trait = Trait.get(params[:id])
  trait.update(
    :student_id        => session[:student],
    :trait_1           => params[:trait_1],
    :trait_2           => params[:trait_2],
    :trait_3           => params[:trait_3],
  )
  redirect "/student/resume/traits/traits"
end

get '/student/resume/traits/:id/delete/?' do
  
  @student = Student.get(session[:student])
  trait = Trait.get(params[:id])
  trait.destroy
  redirect '/student/resume/index'
end
