

get '/?' do
	erb :index, layout: false
end

get '/index/?' do
	erb :index, layout: false
end

get '/admin/admin_edit/?'  do
  auth_admin
  erb :"/admin/admin_edit"
end

post '/admin/admin/?' do
  if (params[:password].strip.downcase == 'coconutisland')
    session[:admin] = true
    redirect '/admin/admin_edit'
  else
    flash[:alert] = 'Yikes! Try typing that again.'
    redirect '/admin/admin'
  end
end

get '/student/report/scores' do
  erb :'/student/report/scores', layout: false
end

get '/student/resume/resume-view' do
  @student = Student.get(session[:student])
  erb :'/student/resume/resume-view'
end

get '/student/resume/resume-print' do
  @student = Student.get(session[:student])
  erb :'/student/resume/resume-print', layout: false
end

get '/student/resume/resume-pdf' do
  @student = Student.get(session[:student])
  
  
  content_type 'application/pdf'

     pdf = Prawn::Document.new
     pdf.font "Helvetica"
     pdf.font_size 9
     
     pdf.move_down(12)
     pdf.text "<b><font size='11px'>Resume</font></b>",
     :inline_format => true, :leading => 16, :align => :center
     
     pdf.text "<b><font size='11px'>#{@student.name}</font></b>",
     :inline_format => true, :leading => 6
		pdf.text "#{@student.address}
		#{@student.city}, #{@student.state}  #{@student.zip}
		#{@student.phone}
		#{@student.email}", 
     :inline_format => true, :leading => 2
      
     pdf.move_down(24)
     pdf.text "<b><font size='10px'>Objectives</font></b>",
       :inline_format => true, :leading => 4
     @student.objectives.each do |objective|
       pdf.text "My immediate goal is to work as #{objective.goal}. This will help me learn #{objective.learn}, 
       as I pursue my long-term goal of #{objective.long_goal}."
     end
      
      pdf.move_down(12) 
		  pdf.text "<b><font size='10px'>Career Skills and Accomplishments</font></b>",
      :inline_format => true, :leading => 4
      @student.skills.each do |skill|
        pdf.text "<b>#{skill.skill}</b>",
        :inline_format => true, :indent_paragraphs => 8, :leading => 1
        pdf.text "•  #{skill.applied_1}
        •  #{skill.applied_2}",
        :inline_format => true, :indent_paragraphs => 16, :leading => 1
        pdf.move_down(6)
      end

      pdf.move_down(6)
		  pdf.text "<b><font size='10px'>Education</font></b>",
        :inline_format => true, :leading => 4
      @student.educations.each do |education|
      if education.attending != ""
        pdf.text "Scheduled to graduate from #{education.attending} on #{format_day(education.graduate_on)}.",
          :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
      if education.plan_attend != ""
        pdf.text "I plan to attend #{education.plan_attend} to study #{education.study}.",
          :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
      if education.completed != ""
        pdf.text "I have completed #{education.completed} on #{format_day(education.completed_on)}",
          :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
      if education.graduated != ""
        pdf.text "I have graduated from #{education.graduated} on #{format_day(education.graduation_date)} with a #{education.degree} degree.",
          :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
    end
    
    pdf.move_down(12)
		pdf.text "<b><font size='10px'>Work Experience</font></b>",
      :inline_format => true, :leading => 4
      @student.experiences.each do |experience|
        pdf.text "•  #{experience.company}, #{experience.position}, #{experience.city}, #{experience.state}, #{format_day(experience.start)} - #{format_day(experience.end)}",
         :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
    pdf.move_down(12)
		pdf.text "<b><font size='10px'>Activities and Associations</font></b>",
      :inline_format => true, :leading => 4
      @student.activities.each do |activity|
        pdf.text "•  #{activity.position.capitalize}, #{activity.organization}, #{format_day(activity.date_start)} - #{format_day(activity.date_end)}",
          :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
      pdf.move_down(12)
		pdf.text "<b><font size='10px'>Awards and Commendations</font></b>",
      :inline_format => true, :leading => 4
      @student.awards.each do |award|
        pdf.text "•  #{award.award.capitalize}, #{format_day(award.award_date)}",
          :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
    pdf.move_down(12)
		pdf.text "<b><font size='10px'>Interests and Hobbies</font></b>",
      :inline_format => true, :leading => 4
			@student.interests.each do |interest|
        pdf.text "•  #{interest.interest.capitalize}",  
        :inline_format => true, :indent_paragraphs => 8, :leading => 1
      end
    
    pdf.move_down(12)
	    pdf.text "<b><i>References available upon request</i></b>", 
      :inline_format => true, :align => :center

    pdf.render_file "#{@student.name.split.join}-resume.pdf"
    
    send_file "#{@student.name.split.join}-resume.pdf", :type => :pdf
    
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


