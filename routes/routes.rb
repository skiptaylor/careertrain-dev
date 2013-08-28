get '/?' do
	erb :index, layout: false
end

get '/index/?' do
	erb :index, layout: false
end

get '/admin/?'  do
  erb :"/admin/admin"
end

get '/admin/admin_edit/?'  do
  auth_admin
  erb :"/admin/admin_edit"
end

post '/admin/admin/?' do
  if (params[:password].strip.downcase == 'coconutisland')
    session[:admin] = true
    redirect '/admin/admin_edit'
  else
    flash[:alert] = 'Bad Login. Try Again.'
    redirect '/admin/admin'
  end
end

get '/student/report/scores' do
  erb :'/student/report/scores', layout: false
end

get '/student/resume/resume-view' do
  @student = Student.get(session[:student])
  erb :'/student/resume/resume-view'
end

get '/student/resume/resume-print' do
  @student = Student.get(session[:student])
  erb :'/student/resume/resume-print', layout: false
end

get '/student/resume/references/references-view' do
  @student = Student.get(session[:student])
  @reference = Reference.get(params[:id])
  erb :'/student/resume/references/references-view'
end

get '/student/resume/letters/letters-view/?' do
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  erb :"/student/resume/letters/letters-view"
end

get '/student/resume/letters/:id/cover-letter' do
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/letters/cover-letter'
end

get '/student/resume/letters/:id/thank-you-letter' do
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  erb :'/student/resume/letters/thank-you-letter'
end