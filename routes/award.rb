get '/student/resume/awards/?' do
  @student = Student.get(session[:student])
	@award = Award.all
	erb :awards
end

get '/student/resume/awards/new/?' do
  @student = Student.get(session[:student])
  @award = Award.new
  erb :'student/resume/awards/edit'
end

post '/student/resume/awards/new/?' do
  award = Award.create(
    :student_id         => session[:student],
    :award              => params[:award],
    :award_date         => params[:award_date],
    :award_date_change  => params[:award_date_change]
  )
  redirect "/student/resume/awards/awards"
end

get '/student/resume/awards/awards/?' do
  @student = Student.get(session[:student])
  @award = Award.get(params[:id])
  erb :'student/resume/awards/awards'
end

get '/student/resume/awards/:id/view/?' do
  @student = Student.get(session[:student])
  @award = Award.get(params[:id])
  erb :'student/resume/awards/view'
end

get '/student/resume/awards/:id/edit/?' do
  @student = Student.get(session[:student])
  @award = Award.get(params[:id])
  erb :'student/resume/awards/edit'
end

post '/student/resume/awards/:id/edit/?' do
  @student = Student.get(session[:student])
  award = Award.get(params[:id])
  award.update(
    :student_id         => session[:student],
    :award              => params[:award],
    :award_date         => params[:award_date],
    :award_date_change  => params[:award_date_change]
  )
  redirect "/student/resume/awards/awards"
end

get '/student/resume/awards/:id/delete/?' do
  @student = Student.get(session[:student])
  award = Award.get(params[:id])
  award.destroy
  redirect '/student/resume/awards/awards'
end
