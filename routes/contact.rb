get '/contacts/?' do
	@contact = Contact.all
	erb :contacts
end

get '/users/:user_id/contacts/new/?' do
  @contact = Contact.new
  erb :edit_contact
end

post '/users/:user_id/contacts/new/?' do
  contact = Contact.create(
    :email      => params[:email],
    :password   => params[:password]
  )
  redirect '/contacts'
end

get '/users/:user_id/contacts/:id/?' do
  @contact = Contact.get(params[:id])
  erb :contact
end

get '/users/:user_id/contacts/:id/edit/?' do
  @contact = Contact.get(params[:id])
  erb :edit_contact
end

post '/users/:user_id/contacts/:id/edit/?' do
  contact = Contact.get(params[:id])
  contact.update(
    :email  => params[:email],
    :password  => params[:password]
  )
  redirect '/contacts'
end

get '/users/:user_id/contacts/:id/delete/?' do
  contact = Contact.get(params[:id])
  contact.destroy
  redirect '/contacts'
end