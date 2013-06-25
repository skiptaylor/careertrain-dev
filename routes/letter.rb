get '/student/resume/letters/?' do
  @student = Student.get(session[:student])
	@letter = Letter.all
	erb :'/student/resume/letters'
end

get '/student/resume/letters/new/?' do
  @student = Student.get(session[:student])
  @letter = Letter.new
  erb :'/student/resume/letters/edit'
end

post '/student/resume/letters/new/?' do
  letter = Letter.create(
    :student_id   => params[:student_id],
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
  redirect '/student/resume/letters/view'
end

get '/student/resume/letters/letter?' do
  @student = Student.get(session[:student])
	@letter = Letter.all
	erb :'letters'
end

get '/student/resume//letters/view/?' do
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  erb :view
end

get '/student/resume//letters/:id/edit/?' do
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  erb :'/student/resume/letters/edit'
end

post '/student/resume//letters/:id/edit/?' do
  letter = Letter.get(params[:id])
  letter.update(
    :student_id   => params[:student_id],
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
  redirect '/student/resume//letters/view'
end

get '/student/resume//letters/:id/delete/?' do
  @student = Student.get(session[:student])
  letter = Letter.get(params[:id])
  letter.destroy
  redirect '/student/resume//letters'
end
