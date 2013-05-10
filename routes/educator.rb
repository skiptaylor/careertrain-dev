namespace '/educator' do
  
  ['/student/resume/sign-in/?'].each do |path|
    before(path) { authenticate :educator }
  end
  
  get '/request/?' do
    @client = Client.new
    erb :"/educator/request"
  end

  post '/request/?' do
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
  
    redirect "/educator/thanks"
  end
  
end