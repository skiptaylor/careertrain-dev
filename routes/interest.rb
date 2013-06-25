get '/interests/?' do
	@interest = Interest.all
	erb :interests
end

get '/interests/new/?' do
  @interest = Interest.new
  erb :edit_interest
end

post '/interests/new/?' do
  interest = Interest.create(
    :interest  => params[:interest],
    :student_id   => params[:student_id]
  )
  redirect '/interests'
end

get '/interests/:id/?' do
  @interest = Interest.get(params[:id])
  erb :interests
end

get '/interests/:id/edit/?' do
  @interest = Interest.get(params[:id])
  erb :edit_interest
end

post '/interests/:id/edit/?' do
  interest = Interest.get(params[:id])
  interest.update(
    :interest  => params[:interest],
    :student_id   => params[:student_id]
  )
  redirect '/interests'
end

get '/interests/:id/delete/?' do
  interest = Interest.get(params[:id])
  interest.destroy
  redirect '/interests'
end
