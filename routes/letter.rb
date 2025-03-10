get '/student/resume/letters/?' do
  auth_student
  @student = Student[session[:student]]
	@letter = Letter.all
	erb :'/student/resume/letters'
end

get '/student/resume/letters/new/?' do
  auth_student
  @student = Student[session[:student]]
  @letter = Letter.new
  erb :'/student/resume/letters/edit'
end

post '/student/resume/letters/new/?' do
  auth_student
  letter = Letter.create(
    :student_id   => session[:student],
    :title        => params[:title],
    :first        => params[:first],
    :last         => params[:last],
    :position     => params[:position],
    :company      => params[:company],
    :address      => params[:address],
    :city         => params[:city],
    :state        => params[:state],
    :zip          => params[:zip],
    :apply        => params[:apply],
    :opening      => params[:opening]
  )
  redirect "/student/resume/letters/letters"
end

get '/student/resume/letters/letters/?' do
  auth_student
  @student = Student[session[:student]]
	@letter = Letter[params[:id]]
	erb :'/student/resume/letters/letters'
end

get "/student/resume/letters/:id/view/?" do
  auth_student
  @student = Student[session[:student]]
  @letter = Letter[params[:id]]
  erb :"/student/resume/letters/view"
end

get '/student/resume/letters/:id/edit/?' do
  auth_student
  @student = Student[session[:student]]
  @letter = Letter[params[:id]]
  erb :"/student/resume/letters/edit"
end

post '/student/resume/letters/:id/edit/?' do
  auth_student
  @student = Student[session[:student]]
  letter = Letter[params[:id]]
  letter.update(
    :student_id   => session[:student],
    :title        => params[:title],
    :first        => params[:first],
    :last         => params[:last],
    :position     => params[:position],
    :company      => params[:company],
    :address      => params[:address],
    :city         => params[:city],
    :state        => params[:state],
    :zip          => params[:zip],
    :apply        => params[:apply],
    :opening      => params[:opening]
  )
  redirect "/student/resume/letters/#{letter.id}/view"
end

get '/student/resume/letters/:id/delete/?' do
  auth_student
  @student = Student[session[:student]]
  letter = Letter[params[:id]]
  letter.destroy
  redirect '/student/resume/letters/letters'
end
