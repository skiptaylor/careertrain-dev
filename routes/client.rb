get '/arng/schools/schools/?' do
  auth_cdguard
	@client = Client.all
	erb :'/arng/schools/schools'
end

get '/arng/schools/new/?' do
  auth_cdguard
  @client = Client.new
  erb :'/arng/schools/edit_school'
end

post '/arng/schools/new/?' do
  auth_cdguard
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
  
  redirect "/arng/schools/#{client.id}/edit"
end

get '/arng/schools/:id/?' do
  auth_cdguard
  @client = Client.get(params[:id])
  erb :"/arng/schools/edit_school"
end

get '/arng/schools/:id/edit/?' do
  auth_cdguard
  @client = Client.get(params[:id])
  erb :"/arng/schools/edit_school"
end

post '/arng/schools/:id/edit/?' do
  auth_cdguard
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
  
  redirect "/arng/schools/#{params[:id]}/edit"
end

get '/arng/schools/:id/school/?' do
  auth_cdguard
  @client = Client.get(params[:id])
  erb :"/arng/schools/school"
end

get '/arng/schools/:id/delete/?' do
  auth_cdguard
  client = Client.get(params[:id])
  client.destroy
  redirect "/arng/schools/schools"
end

get '/arng/schools/schools/?' do
  auth_cdguard
	@client = Client.all
	erb :'/arng/schools/schools'
end

post '/arng/arng/?' do
  if (params[:password].strip.downcase == 'cdguard') || (params[:email].strip.downcase.include?('.mil'))
    session[:cdguard] = true
    redirect '/arng/leads'
  else
    flash[:alert] = 'Bad Login. Try Again.'
    redirect '/arng/arng'
  end
end

get '/arng/faq/?' do
  auth_cdguard
  erb :"/arng/faq"
end

get '/arng/leads/?' do
  auth_cdguard
  erb :"/arng/leads"
end

get '/arng/downloads/?' do
  auth_cdguard
  erb :"/arng/downloads"
end

get '/arng/feedback/?' do
  auth_cdguard
  erb :"/arng/feedback"
end

get '/arng/practices/?' do
  auth_cdguard
  erb :"/arng/practices"
end

get '/arng/register/?' do
  auth_cdguard
  @client = Client.all
  unless params[:zip]
    @results = []
  else
    @results = Client.all(school_zip: params[:zip].strip.downcase)
  end
  erb :"/arng/register"
end


get '/arng/show_password/?' do
  auth_cdguard
  @client = Client.all
  erb :"/arng/show_password"
end

get '/arng/show_schools/?' do
  auth_cdguard
  erb :"/arng/show_schools"
end

helpers do

  # Using auth_cdguard:
  #
  # get 'your/route/here/?' do
  #   auth_cdguard
  #   ...do stuff...
  #   erb :'your/route/view'
  # end

  def auth_cdguard
    unless session[:cdguard] == true
      flash[:alert] = 'You must login to see that page.'
      redirect '/arng/arng'
    end
  end
  
end