get '/resumes/?' do
	@resumes = Resume.all
	erb :resumes
end

get '/resumes/new/?' do
  @resumes = Resume.new
  erb :edit_resume
end

post '/resumes/new/?' do
  resume = Resume.create(
    :email      => params[:email],
    :password   => params[:password]
  )
  redirect '/resumes'
end

get '/resumes/:id/?' do
  @resumes = Resume.get(params[:id])
  erb :resume
end

get '/resumes/:id/edit/?' do
  @resumes = Resume.get(params[:id])
  erb :edit_resume
end

post '/resumes/:id/edit/?' do
  resume = Resume.get(params[:id])
  resume.update(
    :email  => params[:email],
    :password  => params[:password]
  )
  redirect '/resumes'
end

get '/resumes/:id/delete/?' do
  resume = Resume.get(params[:id])
  resume.destroy
  redirect '/resumes'
end