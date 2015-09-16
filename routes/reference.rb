get '/student/resume/references/?' do
  
  @student = Student.get(session[:student])
	@reference = Reference.all
	erb :'/student/resume/references'
end

get '/student/resume/references/new/?' do
  
  @student = Student.get(session[:student])
  @reference = Reference.new
  erb :'/student/resume/references/edit'
end

post '/student/resume/references/new/?' do
  
  reference = Reference.create(
    :student_id     => session[:student],
    :name           => params[:name],
    :relationship   => params[:relationship],
    :address        => params[:address],
    :city           => params[:city],
    :state          => params[:state],
    :zip            => params[:zip],
    :phone          => params[:phone],
    :email          => params[:email]
  )
  redirect '/student/resume/references/references'
end

get '/student/resume/references/references?' do
  
  @student = Student.get(session[:student])
  @reference = Reference.get(params[:id])
  erb :'/student/resume/references/references'
end


get '/student/resume/references/:id/view?' do
  
  @student = Student.get(session[:student])
  @reference = Reference.get(params[:id])
  erb :'/student/resume/references/view'
end

get '/student/resume/references/:id/edit/?' do
  
  @student = Student.get(session[:student])
  @reference = Reference.get(params[:id])
  erb :'/student/resume/references/edit'
end

post '/student/resume/references/:id/edit/?' do
  
  @student = Student.get(session[:student])
  reference = Reference.get(params[:id])
  reference.update(
    :student_id     => session[:student],
    :name           => params[:name],
    :relationship   => params[:relationship],
    :address        => params[:address],
    :city           => params[:city],
    :state          => params[:state],
    :zip            => params[:zip],
    :phone          => params[:phone],
    :email          => params[:email]
  )
  redirect '/student/resume/references/references'
end

get '/student/resume/references/:id/delete/?' do
  
  @student = Student.get(session[:student])
  reference = Reference.get(params[:id])
  reference.destroy
  redirect '/student/resume/references/references'
end