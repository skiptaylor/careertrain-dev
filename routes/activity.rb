get '/student/resume/activities/?' do
  auth_student
  @student = Student.get(session[:student])
	@activity = Activity.all
	erb :'/student/resume/activities'
end

get '/student/resume/activities/new/?' do
  auth_student
  @student = Student.get(session[:student])
  @activity = Activity.new
  erb :'/student/resume/activities/edit'
end

post '/student/resume/activities/new/?' do
  auth_student
  params[:date_start] = nil if params[:date_start] == ''
  params[:date_end] = nil if params[:date_end] == ''
  activity = Activity.create(
    :position           => params[:position],
    :organization       => params[:organization],
    :date_start         => params[:date_start],
    :date_end           => params[:date_end],
    :student_id         => session[:student]
  )
  
  redirect '/student/resume/activities/activities'
end

get '/student/resume/activities/activities/?' do
  auth_student
  @student = Student.get(session[:student])
  @activity = Activity.get(params[:id])
  erb :'/student/resume/activities/activities'
end


get '/student/resume/activities/:id/view/?' do
  auth_student
  @student = Student.get(session[:student])
  @activity = Activity.get(params[:id])
  erb :'/student/resume/activities/view'
end

get '/student/resume/activities/:id/edit/?' do
  auth_student
  @student = Student.get(session[:student])
  @activity = Activity.get(params[:id])
  erb :'/student/resume/activities/edit'
end

post '/student/resume/activities/:id/edit/?' do
  auth_student
  @student = Student.get(session[:student])
  activity = Activity.get(params[:id])
  params[:date_start] = nil if params[:date_start] == ''
  params[:date_end] = nil if params[:date_end] == ''
  activity.update(
    :position           => params[:position],
    :organization       => params[:organization],
    :date_start         => params[:date_start],
    :date_end           => params[:date_end],
    :student_id         => session[:student]
  )

  redirect '/student/resume/activities/activities'
end

get '/student/resume/activities/:id/delete/?' do
  auth_student
  @student = Student.get(session[:student])
  activity = Activity.get(params[:id])
  activity.destroy
  redirect '/student/resume/activities/activities'
end
