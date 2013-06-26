get '/student/resume/education/?' do
  @student = Student.get(session[:student])
	@education = Education.all
	erb :'/student/resume/education/edit'
end

get '/student/resume/education/new/?' do
  @student = Student.get(session[:student])
  @education = Education.new
  erb :'/student/resume/education/edit'
end

post '/student/resume/education/new/?' do
  education = Education.create(
    :student_id               => session[:student],
    :attending                => params[:attending],
    :graduate_on              => params[:graduate_on],
    :plan_attend              => params[:plan_attend],
    :completed                => params[:completed],
    :completed_on             => params[:completed_on],
    :graduation_date          => params[:graduation_date],
    :study                    => params[:study],
    :grad_date_change         => params[:grad_date_change],
    :completed_date_change    => params[:completed_date_change],
    :graduation_date_change   => params[:graduation_date_change],
    :degree                   => params[:degree]
  )
  redirect "/student/resume/education/#{education.id}/edit"
end

get '/student/resume/education/view?' do
  @student = Student.get(session[:student])
	@education = Education.get(params[:id])
	erb :'/student/resume/education/view'
end

get '/student/resume/education/:id/edit/?' do
  @student = Student.get(session[:student])
  @education = Education.get(params[:id])
  erb :'/student/resume/education/edit'
end

post '/student/resume/education/:id/edit/?' do
  @student = Student.get(session[:student])
  education = Education.get(params[:id])
  education.update(
    :student_id               => session[:student],
    :attending                => params[:attending],
    :graduate_on              => params[:graduate_on],
    :plan_attend              => params[:plan_attend],
    :completed                => params[:completed],
    :completed_on             => params[:completed_on],
    :graduation_date          => params[:graduation_date],
    :study                    => params[:study],
    :grad_date_change         => params[:grad_date_change],
    :completed_date_change    => params[:completed_date_change],
    :graduation_date_change   => params[:graduation_date_change],
    :degree                   => params[:degree]
  )
  redirect "/student/resume/education/#{education.id}/view"
end

get '/student/resume/education/:id/delete/?' do
  @student = Student.get(session[:student])
  education = Education.get(params[:id])
  education.destroy
  redirect '/student/resume/index'
end
