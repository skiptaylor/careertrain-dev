get '/student/resume/experience/?' do
  @student = Student.get(session[:student])
	@experience = Experience.all
	erb :'/student/resume/experience'
end

get '/student/resume/experience/new/?' do
  @student = Student.get(session[:student])
  @experience = Experience.new
  erb :'/student/resume/experience/edit'
end

post '/student/resume/experience/new/?' do
  experience = Experience.create(
    :student_id     => session[:student],
    :company        => params[:company],
    :city           => params[:city],
    :state          => params[:state],
    :start          => params[:start],
    :end            => params[:end],
    :position       => params[:position],
    :start_change   => params[:start_change],
    :end_change     => params[:end_change]
  )
  redirect '/student/resume/experience/experiences'
end

get '/student/resume/experience/experiences/?' do
  @student = Student.get(session[:student])
  @experience = Experience.get(params[:id])
  erb :'/student/resume/experience/experiences'
end

get '/student/resume/experience/:id/view/?' do
  @student = Student.get(session[:student])
  @experience = Experience.get(params[:id])
  erb :'/student/resume/experience/view'
end

get '/student/resume/experience/:id/edit/?' do
  @student = Student.get(session[:student])
  @experience = Experience.get(params[:id])
  erb :'/student/resume/experience/edit'
end

post '/student/resume/experience/:id/edit/?' do
  @student = Student.get(session[:student])
  experience = Experience.get(params[:id])
  experience.update(
    :student_id     => session[:student],
    :company        => params[:company],
    :city           => params[:city],
    :state          => params[:state],
    :start          => params[:start],
    :end            => params[:end],
    :position       => params[:position],
    :start_change   => params[:start_change],
    :end_change     => params[:end_change]
  )
  redirect '/student/resume/experience/experiences'
end

get '/student/resume/experience/:id/delete/?' do
  @student = Student.get(session[:student])
  experience = Experience.get(params[:id])
  experience.destroy
  redirect '/student/resume/experience/experiences'
end
