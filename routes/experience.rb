get '/experiences/?' do
	@experience = Experience.all
	erb :experiences
end

get '/experiences/new/?' do
  @experience = Experience.new
  erb :edit_experience
end

post '/experiences/new/?' do
  experience = Experience.create(
    :student_id     => params[:student_id],
    :company        => params[:company],
    :city           => params[:city],
    :state          => params[:state],
    :start          => params[:start],
    :end            => params[:end],
    :position       => params[:position],
    :start_change   => params[:start_change],
    :end_change     => params[:end_change]
  )
  redirect '/experiences'
end

get '/experiences/:id/?' do
  @experience = Experience.get(params[:id])
  erb :experience
end

get '/experiences/:id/edit/?' do
  @experience = Experience.get(params[:id])
  erb :edit_experience
end

post '/experiences/:id/edit/?' do
  experience = Experience.get(params[:id])
  experience.update(
    :student_id     => params[:student_id],
    :company        => params[:company],
    :city           => params[:city],
    :state          => params[:state],
    :start          => params[:start],
    :end            => params[:end],
    :position       => params[:position],
    :start_change   => params[:start_change],
    :end_change     => params[:end_change]
  )
  redirect '/experiences'
end

get '/experiences/:id/delete/?' do
  experience = Experience.get(params[:id])
  experience.destroy
  redirect '/experiences'
end
