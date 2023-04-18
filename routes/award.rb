get '/student/resume/awards/?' do
  auth_student
  @student = Student.get(session[:student])
	@award = Award.all
	erb :awards
end

get '/student/resume/awards/new/?' do
  auth_student
  @student = Student.get(session[:student])
  @award = Award.new
  erb :'student/resume/awards/edit'
end

post '/student/resume/awards/new/?' do
  auth_student
  params[:award_date] = nil if params[:award_date] == ''
  award = Award.create(
    :student_id         => session[:student],
    :award              => params[:award],
    :award_date         => params[:award_date],
  )
  redirect "/student/resume/awards/awards"
end

get '/student/resume/awards/awards/?' do
  auth_student
  @student = Student.get(session[:student])
  @award = Award.get(params[:id])
  erb :'student/resume/awards/awards'
end

get '/student/resume/awards/:id/view/?' do
  auth_student
  @student = Student.get(session[:student])
  @award = Award.get(params[:id])
  erb :'student/resume/awards/view'
end

get '/student/resume/awards/:id/edit/?' do
  auth_student
  @student = Student.get(session[:student])
  @award = Award.get(params[:id])
  erb :'student/resume/awards/edit'
end

post '/student/resume/awards/:id/edit/?' do
  auth_student
  @student = Student.get(session[:student])
  award = Award.get(params[:id])
  params[:award_date] = nil if params[:award_date] == ''
  award.update(
    :student_id         => session[:student],
    :award              => params[:award],
    :award_date         => params[:award_date]
  )
  redirect "/student/resume/awards/awards"
end

get '/student/resume/awards/:id/delete/?' do
  auth_student
  @student = Student.get(session[:student])
  award = Award.get(params[:id])
  award.destroy
  redirect '/student/resume/awards/awards'
end
