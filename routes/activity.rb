get '/activities/?' do
	@activity = Activity.all
	erb :activities
end

get '/activities/new/?' do
  @activity = Activity.new
  erb :edit_activity
end

post '/activities/new/?' do
  activity = Activity.create(
    :position           => params[:position],
    :organization       => params[:organization],
    :date_start         => params[:date_start],
    :date_end           => params[:date_end],
    :student_id         => params[:student_id],
    :date_start_change  => params[:date_start_change],
    :date_end_change    => params[:date_end_change]
  )
  redirect '/activities'
end

get '/activities/:id/?' do
  @activity = Activity.get(params[:id])
  erb :activity
end

get '/activities/:id/edit/?' do
  @activity = Activity.get(params[:id])
  erb :edit_activity
end

post '/activities/:id/edit/?' do
  activity = Activity.get(params[:id])
  activity.update(
  :position           => params[:position],
  :organization       => params[:organization],
  :date_start         => params[:date_start],
  :date_end           => params[:date_end],
  :student_id         => params[:student_id],
  :date_start_change  => params[:date_start_change],
  :date_end_change    => params[:date_end_change]
    
  )
  redirect '/activities'
end

get '/activities/:id/delete/?' do
  activity = Activity.get(params[:id])
  activity.destroy
  redirect '/activities'
end
