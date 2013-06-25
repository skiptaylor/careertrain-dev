get '/awards/?' do
	@award = Award.all
	erb :awards
end

get '/awards/new/?' do
  @award = Award.new
  erb :edit_award
end

post '/awards/new/?' do
  award = Award.create(
    :student_id         => params[:student_id],
    :award              => params[:award],
    :award_date         => params[:award_date],
    :award_date_change  => params[:award_date_change]
  )
  redirect '/awards'
end

get '/awards/:id/?' do
  @award = Award.get(params[:id])
  erb :award
end

get '/awards/:id/edit/?' do
  @award = Award.get(params[:id])
  erb :edit_award
end

post '/awards/:id/edit/?' do
  award = Award.get(params[:id])
  award.update(
    :student_id         => params[:student_id],
    :award              => params[:award],
    :award_date         => params[:award_date],
    :award_date_change  => params[:award_date_change]
  )
  redirect '/awards'
end

get '/awards/:id/delete/?' do
  award = Award.get(params[:id])
  award.destroy
  redirect '/awards'
end
