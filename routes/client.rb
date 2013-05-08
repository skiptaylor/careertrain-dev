get '/arng/schools/?' do
	@client = Client.all
	erb :'/arng/schools/schools'
end

get '/arng/schools/new/?' do
  @client = Client.new
  erb :'/arng/schools/edit_school'
end

post '/arng/schools/new/?' do
  client = Client.create(
    :school_id              => params[:school_id],
    :date_modified          => params[:date_modified],
    :first_name             => params[:first_name],
    :middle_initial         => params[:middle_initial],
    :last_name              => params[:last_name],
    :school_name            => params[:school_name],
    :school_address1        => params[:school_address1],
    :school_address2        => params[:school_address2],
    :school_city            => params[:school_city],
    :school_state           => params[:school_state],
    :school_zip             => params[:school_zip],
    :school_zip_unique      => params[:school_zip_unique],
    :mail_address1          => params[:mail_address1],
    :mail_address2          => params[:mail_address2],
    :mail_city              => params[:mail_city],
    :mail_state             => params[:mail_state],
    :mail_zip               => params[:mail_zip],
    :phone                  => params[:phone],
    :fax                    => params[:fax],
    :ng_rep                 => params[:ng_rep],
    :email                  => params[:email],
    :number_seniors         => params[:number_seniors]
  )
  params[:active] 					? client.update(:active => true)    : client.update(:active => false)
  params[:cd] 					    ? client.update(:cd => true)        : client.update(:cd => false)
  params[:ff] 					    ? client.update(:ff => true)        : client.update(:ff => false)
  params[:cd_before] 				? client.update(:cd_before => true) : client.update(:cd_before => false)
  
  redirect "/arng/schools/#{params[:id]}/edit_school"
end

get '/arng/schools/:id/?' do
  @client = Client.get(params[:id])
  erb :'/arng/schools/edit_school'
end

get '/arng/schools/:id/edit/?' do
  @client = Client.get(params[:id])
  erb :'/arng/schools/edit_school'
end

post '/arng/schools/:id/edit/?' do
  client = Client.get(params[:id])
  client.update(
    :school_id              => params[:school_id],
    :date_modified          => params[:date_modified],
    :first_name             => params[:first_name],
    :middle_initial         => params[:middle_initial],
    :last_name              => params[:last_name],
    :school_name            => params[:school_name],
    :school_address1        => params[:school_address1],
    :school_address2        => params[:school_address2],
    :school_city            => params[:school_city],
    :school_state           => params[:school_state],
    :school_zip             => params[:school_zip],
    :school_zip_unique      => params[:school_zip_unique],
    :mail_address1          => params[:mail_address1],
    :mail_address2          => params[:mail_address2],
    :mail_city              => params[:mail_city],
    :mail_state             => params[:mail_state],
    :mail_zip               => params[:mail_zip],
    :phone                  => params[:phone],
    :fax                    => params[:fax],
    :ng_rep                 => params[:ng_rep],
    :email                  => params[:email],
    :number_seniors         => params[:number_seniors]
  )
  params[:active] 					? client.update(:active => true)    : client.update(:active => false)
  params[:cd] 					    ? client.update(:cd => true)        : client.update(:cd => false)
  params[:ff] 					    ? client.update(:ff => true)        : client.update(:ff => false)
  params[:cd_before] 				? client.update(:cd_before => true) : client.update(:cd_before => false)
  
  redirect "/arng/schools/#{params[:id]}/edit_school"
end

get '/arng/schools/:id/delete/?' do
  client = Client.get(params[:id])
  client.destroy
  redirect "/arng/arng"
end