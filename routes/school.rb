get '/arng/schools/schools/?' do
  auth_recruiter
	@school = School.all(order: [:updated_at.desc], limit: 100)
  
	if params[:search] && !params[:search].nil?
		@school = School.all(:school_zip.like => "%#{params[:search]}%", limit: 30) 
  else
		@school = School.all(:school_name.not => nil, order: [:updated_at.desc], limit: 100)
	end
  
	erb :'/arng/schools/schools'
end





get '/arng/schools/create/?' do
  auth_recruiter
  @state = State.all
  @admin = Admin.all
  @recruiter = Recruiter.all
  @school = School.new
  erb :'/arng/schools/new_admin_school'
end

post '/arng/schools/create/?' do
  auth_recruiter
  state = State.all
  admin = Admin.all
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
  
  
  redirect "/arng/schools/#{school.id}/school"
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
  
   school.recruiter_id == session[:recruiter]
   school.save
  
  redirect "/arng/schools/#{school.id}/school"
end


get '/arng/schools/:id/school/?' do
  auth_recruiter
  @state = State.all
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school = School.get(params[:id])
  erb :"/arng/schools/school"
end




# ----------------  Recruiter Reportas (2)  --------------------

get '/arng/schools/:id/school_report/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id)
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '', :class_date => params[:presentation])
     
    @school.class_date = params[:presentation]
    @school.save
  
  erb :"/arng/schools/school_report"
  
end

get '/arng/schools/:id/summary_report/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id, :class_date => params[:presentation])
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '')
  
  erb :'arng/schools/summary_report', layout: false
  
end

post '/arng/schools/:id/summary_report/?' do
  
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id)
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '')
  
  PDFKit.configure do |config|
    config.default_options = {
      :print_media_type => true,
      :page_size        => 'Letter',
      :margin_top       => '0.25in',
      :margin_right     => '0.25in',
      :margin_bottom    => '0.25in',
      :margin_left      => '0.25in'
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
  @school.presentations = Presentation.all(:school_id => @school.id)
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '')
  
  erb :'arng/schools/ind_report', layout: false
 
end

post '/arng/schools/:id/ind_report/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '', :class_date => params[:presentation])
  
  PDFKit.configure do |config|
    config.default_options = {
      :print_media_type => true,
      :page_size        => 'Letter',
      :margin_top       => '0.25in',
      :margin_right     => '0.25in',
      :margin_bottom    => '0.25in',
      :margin_left      => '0.25in',
      :javascript_delay => 001
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

# get '/arng/schools/:id/?' do
#   auth_recruiter
#   @recruiter = Recruiter.all
#   @state = State.all
#   @school = School.get(params[:id])
#   erb :"/arng/schools/edit_school"
# end

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
    :phone                  => params[:phone],
    :fax                    => params[:fax],
    :ng_rep                 => params[:ng_rep],
    :email                  => params[:email],
    :arng_email             => params[:arng_email],
    :number_seniors         => params[:number_seniors],
    :recruiter_id           => params[:recruiter_id]
  )
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)

  redirect "/arng/schools/#{params[:id]}/school"

end

get '/arng/schools/:id/edit/?' do
  auth_recruiter
   @recruiter = Recruiter.all
  @state = State.all
  @school = School.get(params[:id])
  
  erb :"/arng/schools/edit_school_arng"
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
    :phone                  => params[:phone],
    :fax                    => params[:fax],
    :ng_rep                 => params[:ng_rep],
    :email                  => params[:email],
    :arng_email             => params[:arng_email],
    :number_seniors         => params[:number_seniors],
    :recruiter_id           => params[:recruiter_id]
  )
  params[:active] 					? school.update(:active => true)    : school.update(:active => false)
  
  redirect "/arng/schools/#{params[:id]}/school"
  
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

# get '/arng/show_password/?' do
#   auth_recruiter
#   @school = School.all
#   erb :"/arng/show_password"
# end
#
# get '/arng/show_schools/?' do
#   auth_recruiter
#   erb :"/arng/show_schools"
# end

require 'json'
require 'csv'

get '/arng/schools/:id/summary_report_csv/?' do
  auth_recruiter
  @school = School.get(params[:id])
  @recruiter = Recruiter.get(params[:recruiter_id])
  @school.presentations = Presentation.all(:school_id => @school.id, :class_date => params[:presentation])
  @school.students = Student.all(:school_password => @school.school_password, :school_password.not => '')
  
  content_type 'application/csv'
  attachment "summery_report.csv"
  csv_string = CSV.generate do |csv|
      csv << ["Summary Report"]
      csv << ["School", "City", "State", "Class Date", "Recruiter"]
      csv << ["#{@school.school_name}", "#{@school.school_city}", "#{@school.school_state}", "#{@school.class_date}", "#{@school.recruiter.rank} #{@school.recruiter.first_name} #{@school.recruiter.last_name}"]
      csv << [""]
      
      csv << ["Student", "Email", "Phone", "Grade", "High Score", "Second High", "Future Plans"]
	  if @school.students.each do |student|
       if student.created_on == @school.class_date  
        csv << ["#{student.first_name} #{student.last_name}", "#{student.email}", "#{student.phone}", "#{student.grade}", "#{student.high1_show}", "#{student.high2_show}", if student.future1 == "on" then "Enter technical college/trade school" else nil end, if student.future2 == "on" then "Work full-time" else nil end, if student.future3 == "on" then "Work part-time" else nil  end, if student.future4 == "on" then "Enter the military" else nil end, if student.future5 == "on" then "Go to college" else nil end, if student.future6 == "on" then "I have money to pay for education" else nil end, if student.future7 == "on" then "Counting on parents for money for education" else nil end, if student.future8 == "on" then "Considering sources of financial aid or scholarships" else nil end]
      end
    end
  end
end

end
