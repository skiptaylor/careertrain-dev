get '/references/?' do
	@reference = Reference.all
	erb :references
end

get '/references/new/?' do
  @reference = Reference.new
  erb :edit_reference
end

post '/references/new/?' do
  reference = Reference.create(
    :student_id     => params[:student_id],
    :name           => params[:name],
    :relationship   => params[:relationship],
    :address        => params[:address],
    :city           => params[:city],
    :state          => params[:state],
    :zip            => params[:zip],
    :phone          => params[:phone],
    :email          => params[:email]
  )
  redirect '/references'
end

get '/references/:id/?' do
  @reference = Reference.get(params[:id])
  erb :reference
end

get '/references/:id/edit/?' do
  @reference = Reference.get(params[:id])
  erb :edit_reference
end

post '/references/:id/edit/?' do
  reference = Reference.get(params[:id])
  reference.update(
    :student_id     => params[:student_id],
    :name           => params[:name],
    :relationship   => params[:relationship],
    :address        => params[:address],
    :city           => params[:city],
    :state          => params[:state],
    :zip            => params[:zip],
    :phone          => params[:phone],
    :email          => params[:email]
  )
  redirect '/references'
end

get '/references/:id/delete/?' do
  reference = Reference.get(params[:id])
  reference.destroy
  redirect '/references'
end