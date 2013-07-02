get '/?' do
	erb :index, layout: false
end

get '/index/?' do
	erb :index, layout: false
end

get '/admin/?'  do
  erb :resume_admin
end

get '/student/report/scores' do
  erb :'/student/report/scores', layout: false
end


get '/student/resume/resume-view' do
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/resume-view'
end

get '/student/resume/resume-print' do
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/resume-print', layout: false
end

get '/student/resume/references-view' do
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/references-view'
end

get '/student/resume/cover-letter' do
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/cover-letter'
end

get '/student/resume/thank-you-letter' do
  @student = Student.get(session[:student])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/thank-you-letter'
end