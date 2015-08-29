get '/student/resume/interests/?' do
  auth_student
  @student = Student.get(session[:student])
	@interest = Interest.all
	erb :"/student/resume/interests"
end

get '/student/resume/interests/new/?' do
  auth_student
  @student = Student.get(session[:student])
  @interest = Interest.new
  erb :"/student/resume/interests/edit"
end

post "/student/resume/interests/new/?" do
  auth_student
  interest = Interest.create(
    :student_id   => session[:student],
    :interest     => params[:interest]
  )
  redirect "/student/resume/interests/interests"
end

get '/student/resume/interests/interests/?' do
  auth_student
  @student = Student.get(session[:student])
  @interest = Interest.get(params[:id])
  erb :"/student/resume/interests/interests"
end

get '/student/resume/interests/:id/view/?' do
  auth_student
  @student = Student.get(session[:student])
  @interest = Interest.get(params[:id])
  erb :"/student/resume/interests/view"
end

get '/student/resume/interests/:id/edit/?' do
  auth_student
  @student = Student.get(session[:student])
  @interest = Interest.get(params[:id])
  erb :"/student/resume/interests/edit"
end

post '/student/resume/interests/:id/edit/?' do
  auth_student
  @student = Student.get(session[:student])
  interest = Interest.get(params[:id])
  interest.update(
    :student_id   => session[:student],
    :interest     => params[:interest]
  )
  redirect "/student/resume/interests/interests"
end

get '/student/resume/interests/:id/delete/?' do
  auth_student
  @student = Student.get(session[:student])
  interest = Interest.get(params[:id])
  interest.destroy
  redirect '/student/resume/interests/interests'
end
