get '/arng/schools/schools/?' do
  auth_recruiter
	@school = School.all(order: [:updated_at.desc], limit: 300)
  
	if params[:search] && !params[:search].nil?
		@school = School.all(:school_zip.like => "%#{params[:search]}%", limit: 30) 
  else
		@school = School.all(:school_name.not => nil, order: [:updated_at.desc], limit: 300)
	end
  
	erb :'/arng/schools/schools'
end

get '/arng/schools/new/?' do
  auth_recruiter
  @state = State.all
  @recruiter = Recruiter.all
  @school = School.new
  erb :'/arng/schools/edit_school'
end

post '/arng/schools/new/?' do
  auth_recruiter
  state = State.all
  recruiter = Recruiter.all
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
    :arng_email             => params[:arng_email],
    :number_seniors         => params[:number_seniors],
    :recruiter_id           => params[:recruiter_id]
  )
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)
  params[:cd] 					    ? school.update(:cd => true)        : school.update(:cd => false)
  params[:ff] 					    ? school.update(:ff => true)        : school.update(:ff => false)
  params[:cd_before] 				? school.update(:cd_before => true) : school.update(:cd_before => false)
  
  if school.recruiter_id = nil
    school.recruiter_id = session[:recruiter]
    school.save
  else
    flash[:alert] = 'That school is being serviced by another rep. Contact your RRC for assistance.'
    redirect "/arng/schools/#{school.id}/school"
  end
  
  redirect "/arng/schools/#{school.id}/school"
end





# ----------------  Recruiter Reportas (2)  --------------------

get '/arng/schools/:id/school_report/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id)
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '', :class_date => params[:presentation])
  
  erb :"/arng/schools/school_report"
end

get '/arng/schools/:id/summary_report/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id)
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '', :class_date => @school.class_date)
  
  erb :'arng/schools/summary_report', layout: false
  
end

post '/arng/schools/:id/summary_report/?' do
  
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id)
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '', :class_date => @school.class_date)
  
  PDFKit.configure do |config|
    config.default_options = {
      :print_media_type => true,
      :page_size        => 'Letter',
      :margin_top       => '0.25in',
      :margin_right     => '0.25in',
      :margin_bottom    => '0.25in',
      :margin_left      => '0.25in',
      :javascript_delay => 200
    }
  end
  
  content_type 'application/pdf'
  
  if settings.development?
    kit = PDFKit.new("http://localhost:4567/arng/schools/#{@school.id}/summary_report")
  elsif settings.production?
    kit = PDFKit.new("https://www.ecareerdirection.com/arng/schools/#{@school.id}/summary_report")
  end
    
  pdf = kit.to_pdf
  
end

get '/arng/schools/:id/ind_report/?' do
  
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '', :class_date => @school.class_date)
  
  erb :'arng/schools/ind_report', layout: false
 
end

post '/arng/schools/:id/ind_report/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '')
  
  PDFKit.configure do |config|
    config.default_options = {
      :print_media_type => true,
      :page_size        => 'Letter',
      :margin_top       => '0.25in',
      :margin_right     => '0.25in',
      :margin_bottom    => '0.25in',
      :margin_left      => '0.25in',
      :javascript_delay => 200
    }
  end
  
  content_type 'application/pdf'
  
  if settings.development?
    kit = PDFKit.new("http://localhost:4567/arng/schools/#{@school.id}/ind_report")
  elsif settings.production?
    kit = PDFKit.new("https://www.ecareerdirection.com/arng/schools/#{@school.id}/ind_report")
  end
   
  pdf = kit.to_pdf
  
end





#  -------------------  ARNG Schools ---------------------

get '/arng/schools/:id/?' do
  auth_recruiter
  @recruiter = Recruiter.all
  @state = State.all
  @school = School.get(params[:id])
  erb :"/arng/schools/edit_school"
end

get '/arng/schools/:id/edit_admin/?' do
  auth_admin
  @recruiter = Recruiter.all
  @state = State.all
  @school = School.get(params[:id])
  erb :"/arng/schools/edit_school_arng"
end

post '/arng/schools/:id/edit_admin/?' do
  auth_admin
  recruiter = Recruiter.all
  state = State.all
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
    :arng_email             => params[:arng_email],
    :number_seniors         => params[:number_seniors],
    :recruiter_id           => params[:recruiter_id]
  )
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)
  params[:cd] 					    ? school.update(:cd => true)        : school.update(:cd => false)
  params[:ff] 					    ? school.update(:ff => true)        : school.update(:ff => false)
  params[:cd_before] 				? school.update(:cd_before => true) : school.update(:cd_before => false)
  
  school.recruiter_id = school.recruiter_id
  
  redirect "/arng/schools/schools" 

end

get '/arng/schools/:id/edit/?' do
  auth_recruiter
  @recruiter = Recruiter.all
  @state = State.all
  @school = School.get(params[:id])
  erb :"/arng/schools/edit_school"
end

post '/arng/schools/:id/edit/?' do
  auth_recruiter
  recruiter = Recruiter.all
  state = State.all
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
    :arng_email             => params[:arng_email],
    :number_seniors         => params[:number_seniors],
    :recruiter_id           => params[:recruiter_id]
  )
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)
  params[:cd] 					    ? school.update(:cd => true)        : school.update(:cd => false)
  params[:ff] 					    ? school.update(:ff => true)        : school.update(:ff => false)
  params[:cd_before] 				? school.update(:cd_before => true) : school.update(:cd_before => false)
  
  
  school.recruiter_id = session[:recruiter]
  school.save
  redirect "/arng/schools/#{params[:id]}/school"
  
end

get '/arng/schools/:id/school/?' do
  auth_recruiter
  @state = State.all
  @recruiter = Recruiter.all
  @school = School.get(params[:id])
  erb :"/arng/schools/school"
end


get '/arng/schools/:id/delete/?' do
  auth_recruiter
  school = School.get(params[:id])
  school.destroy
  redirect "/arng/schools/schools"
end

# -----------------  ARNG Pages  --------------------

get '/arng/arng/?' do
  
	erb :'/arng/arng'
end

get '/arng/faq/?' do
  auth_recruiter
  erb :"/arng/faq"
end

get '/arng/leads/?' do
  auth_recruiter
  erb :"/arng/leads"
end

get '/arng/downloads/?' do
  auth_recruiter
  erb :"/arng/downloads"
end

get '/arng/feedback/?' do
  auth_recruiter
  erb :"/arng/feedback"
end

get '/arng/practices/?' do
  auth_recruiter
  erb :"/arng/practices"
end

get '/arng/register/?' do
  auth_recruiter
  @school = School.all
  unless params[:zip]
    @results = []
  else
    @results = School.all(school_zip: params[:zip].strip.downcase)
  end
  erb :"/arng/register"
end

get '/arng/show_password/?' do
  auth_recruiter
  @school = School.all
  erb :"/arng/show_password"
end

get '/arng/show_schools/?' do
  auth_recruiter
  erb :"/arng/show_schools"
end

