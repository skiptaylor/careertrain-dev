get '/contacts/?' do
	@contact = Contact.all
	erb :contacts
end

get '/contacts/new/?' do
  @contact = Contact.new
  erb :edit_contact
end

post '/contacts/new/?' do
  contact = Contact.create(
    :email      => params[:email],
    :password   => params[:password]
  )
  redirect '/contacts'
end

get '/contacts/:id/?' do
  @contact = Contact.get(params[:id])
  erb :contact
end

get '/contacts/:id/edit/?' do
  @contact = Contact.get(params[:id])
  erb :edit_contact
end

post '/contacts/:id/edit/?' do
  contact = Contact.get(params[:id])
  contact.update(
    :email  => params[:email],
    :password  => params[:password]
  )
  redirect '/contacts'
end

get '/contacts/:id/delete/?' do
  contact = Contact.get(params[:id])
  contact.destroy
  redirect '/contacts'
end