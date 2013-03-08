get '/letters/?' do
	@letter = Letter.all
	erb :letters
end

get '/letters/new/?' do
  @letter = Letter.new
  erb :edit_letter
end

post '/letters/new/?' do
  letter = Letter.create(
    :id_user    => params[:id_user],
    :title      => params[:title],
    :first      => params[:first],
    :last       => params[:last],
    :position   => params[:position],
    :company    => params[:company],
    :address    => params[:address],
    :city       => params[:city],
    :state      => params[:state],
    :zip        => params[:zip],
    :apply      => params[:apply],
    :opening    => params[:opening]
  )
  redirect '/letters'
end

get '/letters/:id/?' do
  @letter = Letter.get(params[:id])
  erb :letters
end

get '/letters/:id/edit/?' do
  @letter = Letter.get(params[:id])
  erb :edit_letter
end

post '/letters/:id/edit/?' do
  letter = Letter.get(params[:id])
  letter.update(
    :id_user    => params[:id_user],
    :title      => params[:title],
    :first      => params[:first],
    :last       => params[:last],
    :position   => params[:position],
    :company    => params[:company],
    :address    => params[:address],
    :city       => params[:city],
    :state      => params[:state],
    :zip        => params[:zip],
    :apply      => params[:apply],
    :opening    => params[:opening]
  )
  redirect '/letters'
end

get '/letters/:id/delete/?' do
  letter = Letter.get(params[:id])
  letter.destroy
  redirect '/letters'
end
