get '/traits/?' do
	@trait = Trait.all
	erb :traits
end

get '/traits/new/?' do
  @trait = Trait.new
  erb :edit_trait
end

post '/traits/new/?' do
  trait = Trait.create(
    :student_id        => params[:student_id],
    :trait_1           => params[:trait_1],
    :trait_2           => params[:trait_2],
    :trait_3           => params[:trait_3],
    :opening_sentence  => params[:opening_sentence]
  )
  redirect '/traits'
end

get '/traits/:id/?' do
  @trait = Trait.get(params[:id])
  erb :traits
end

get '/traits/:id/edit/?' do
  @trait = Trait.get(params[:id])
  erb :edit_trait
end

post '/traits/:id/edit/?' do
  trait = Trait.get(params[:id])
  trait.update(
    :student_id        => params[:student_id],
    :trait_1           => params[:trait_1],
    :trait_2           => params[:trait_2],
    :trait_3           => params[:trait_3],
    :opening_sentence  => params[:opening_sentence]
  )
  redirect '/traits'
end

get '/traits/:id/delete/?' do
  trait = Trait.get(params[:id])
  trait.destroy
  redirect '/traits'
end
