get '/arng/schools/schools/?' do
  auth_cdguard
	@school = School.all
	erb :'/arng/schools/schools'
end

get '/arng/schools/new/?' do
  auth_cdguard
  @school = School.new
  erb :'/arng/schools/edit_school'
end

post '/arng/schools/new/?' do
  auth_cdguard
  school = School.create(
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
    :school_password        => params[:school_password],
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
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)
  params[:cd] 					    ? school.update(:cd => true)        : school.update(:cd => false)
  params[:ff] 					    ? school.update(:ff => true)        : school.update(:ff => false)
  params[:cd_before] 				? school.update(:cd_before => true) : school.update(:cd_before => false)

  redirect "/arng/schools/#{school.id}/school"
end

get '/arng/schools/:id/?' do
  auth_cdguard
  @school = School.get(params[:id])
  erb :"/arng/schools/edit_school"
end

get '/arng/schools/:id/edit/?' do
  auth_cdguard
  @school = School.get(params[:id])
  erb :"/arng/schools/edit_school"
end

post '/arng/schools/:id/edit/?' do
  auth_cdguard
  school = School.get(params[:id])
  school.update(
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
    :school_password        => params[:school_password],
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
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)
  params[:cd] 					    ? school.update(:cd => true)        : school.update(:cd => false)
  params[:ff] 					    ? school.update(:ff => true)        : school.update(:ff => false)
  params[:cd_before] 				? school.update(:cd_before => true) : school.update(:cd_before => false)

  redirect "/arng/schools/#{params[:id]}/school"
end

get '/arng/schools/:id/school/?' do
  auth_cdguard
  @school = School.get(params[:id])
  erb :"/arng/schools/school"
end

get '/arng/schools/:id/delete/?' do
  auth_cdguard
  school = School.get(params[:id])
  school.destroy
  redirect "/arng/schools/schools"
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
  @school = School.all
  unless params[:zip]
    @results = []
  else
    @results = School.all(school_zip: params[:zip].strip.downcase)
  end
  erb :"/arng/register"
end

get '/arng/show_password/?' do
  auth_cdguard
  @school = School.all
  erb :"/arng/show_password"
end

get '/arng/show_schools/?' do
  auth_cdguard
  erb :"/arng/show_schools"
end

helpers do

  def auth_cdguard
    unless session[:cdguard] == true || session[:admin] == true
      flash[:alert] = 'You must login to see that page.'
      redirect '/arng/arng'
    end
  end

  def auth_admin
    unless session[:admin] == true
      flash[:alert] = 'You must be an admin to see that page.'
      redirect '/index'
    end
  end

  # def generate_password
  #   if school.active = true
  #     school.school_password = "cd#school.school_zip"
  #   else
  #     school.school_password = ""
  #   end
  # end

  # passwords = School.all(school_zip: school.school_zip).map { |s| zips << s.school_password }
 #  passwords = passwords.sort{ |a, b| a <=> b }
 #  if passwords.count == 0
 #    code = '01'
 #  else
 #    code = zips.last.sub("cd32207", '').to_i + 1
 #  end
 #  ("%02d" % code.to_i).to_s if code.to_i < 10
 #  school.school_password = "cd#{school.school_zip}#{code}"

end



