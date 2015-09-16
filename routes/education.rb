get '/student/resume/educations/?' do
  
  @student = Student.get(session[:student])
  @education = Education.all
  erb :'/student/resume/educations/educations'
end

get '/student/resume/educations/new/?' do
  
  @student = Student.get(session[:student])
  @education = Education.new
  erb :'/student/resume/educations/edit'
end

post '/student/resume/educations/new/?' do
  
  params[:graduate_on] = nil if params[:graduate_on] == ''
  params[:completed_on] = nil if params[:completed_on] == ''
  params[:graduation_date] = nil if params[:graduation_date] == ''
  education = Education.create(
    :student_id               => session[:student],
    :attending                => params[:attending],
    :graduate_on              => params[:graduate_on],
    :plan_attend              => params[:plan_attend],
    :completed                => params[:completed],
    :graduated                => params[:graduated],
    :completed_on             => params[:completed_on],
    :graduation_date          => params[:graduation_date],
    :study                    => params[:study],
    :degree                   => params[:degree]
  )
  redirect "/student/resume/educations/educations"
end

get '/student/resume/educations/educations/?' do
  
  @student = Student.get(session[:student])
	@education = Education.get(params[:id])
	erb :'/student/resume/educations/educations'
end

get '/student/resume/educations/:id/edit/?' do
  
  @student = Student.get(session[:student])
  @education = Education.get(params[:id])
  erb :'/student/resume/educations/edit'
end

post '/student/resume/educations/:id/edit/?' do
  
  @student = Student.get(session[:student])
  education = Education.get(params[:id])
  params[:graduate_on] = nil if params[:graduate_on] == ''
  params[:completed_on] = nil if params[:completed_on] == ''
  params[:graduation_date] = nil if params[:graduation_date] == ''
  education.update(
    :student_id               => session[:student],
    :attending                => params[:attending],
    :graduate_on              => params[:graduate_on],
    :plan_attend              => params[:plan_attend],
    :completed                => params[:completed],
    :graduated                => params[:graduated],
    :completed_on             => params[:completed_on],
    :graduation_date          => params[:graduation_date],
    :study                    => params[:study],
    :degree                   => params[:degree]
  )
  redirect "/student/resume/educations/educations"
end

get '/student/resume/educations/:id/delete/?' do
  
  @student = Student.get(session[:student])
  education = Education.get(params[:id])
  education.destroy
  redirect '/student/resume/index'
end
