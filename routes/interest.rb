get '/student/resume/interests/?' do
  
  @student = Student.get(session[:student])
	@interest = Interest.all
	erb :"/student/resume/interests"
end

get '/student/resume/interests/new/?' do
  
  @student = Student.get(session[:student])
  @interest = Interest.new
  erb :"/student/resume/interests/edit"
end

post "/student/resume/interests/new/?" do
  
  interest = Interest.create(
    :student_id   => session[:student],
    :interest     => params[:interest]
  )
  redirect "/student/resume/interests/interests"
end

get '/student/resume/interests/interests/?' do
  
  @student = Student.get(session[:student])
  @interest = Interest.get(params[:id])
  erb :"/student/resume/interests/interests"
end

get '/student/resume/interests/:id/view/?' do
  
  @student = Student.get(session[:student])
  @interest = Interest.get(params[:id])
  erb :"/student/resume/interests/view"
end

get '/student/resume/interests/:id/edit/?' do
  
  @student = Student.get(session[:student])
  @interest = Interest.get(params[:id])
  erb :"/student/resume/interests/edit"
end

post '/student/resume/interests/:id/edit/?' do
  
  @student = Student.get(session[:student])
  interest = Interest.get(params[:id])
  interest.update(
    :student_id   => session[:student],
    :interest     => params[:interest]
  )
  redirect "/student/resume/interests/interests"
end

get '/student/resume/interests/:id/delete/?' do
  
  @student = Student.get(session[:student])
  interest = Interest.get(params[:id])
  interest.destroy
  redirect '/student/resume/interests/interests'
end
