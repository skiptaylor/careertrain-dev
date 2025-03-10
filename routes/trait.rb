get '/student/resume/traits/?' do
  auth_student
  @student = Student[session[:student]]
	@trait = Trait.all
	erb :'/student/resume/traits/traits'
end

get '/student/resume/traits/new/?' do
  auth_student
  @student = Student[session[:student]]
  @trait = Trait.new
  erb :"/student/resume/traits/edit"
end

post '/student/resume/traits/new/?' do
  auth_student
  trait = Trait.create(
    :student_id        => session[:student],
    :trait_1           => params[:trait_1],
    :trait_2           => params[:trait_2],
    :trait_3           => params[:trait_3],
  )
  redirect "/student/resume/traits/traits"
end

get '/student/resume/traits/traits/?' do
  auth_student
  @student = Student[session[:student]]
	@trait = Trait[params[:id]]
	erb :'/student/resume/traits/traits'
end

get '/student/resume/traits/:id/view?' do
  auth_student
  @student = Student[session[:student]]
  @trait = Trait[params[:id]]
  erb :'/student/resume/traits/view'
end

get '/student/resume/traits/:id/edit/?' do
  auth_student
  @student = Student[session[:student]]
  @trait = Trait[params[:id]]
  erb :'/student/resume/traits/edit'
end

post '/student/resume/traits/:id/edit/?' do
  auth_student
  @student = Student[session[:student]]
  trait = Trait[params[:id]]
  trait.update(
    :student_id        => session[:student],
    :trait_1           => params[:trait_1],
    :trait_2           => params[:trait_2],
    :trait_3           => params[:trait_3],
  )
  redirect "/student/resume/traits/traits"
end

get '/student/resume/traits/:id/delete/?' do
  auth_student
  @student = Student[session[:student]]
  trait = Trait[params[:id]]
  trait.destroy
  redirect '/student/resume/index'
end
