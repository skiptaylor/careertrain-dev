class Email

  def self.reset(to, password)
    body = ""
    body << "<p>Resume Tool Account</p>"
    body << "<p>Your Password: #{password}</p>"

    Pony.mail(headers: { 'Content-Type' => 'text/html' },
                   to: to,
                 from: 'no-reply@eCareerDirection.com',
              subject: 'Resume Tool Account Password',
                 body: body)
  end
  
  # def self.requestcd2(school_name, school_address1, school_address2, school_city, state, school_zip, first_name, last_name, email, phone)
#
#     body = ''
#     body << "<h3>Request eCD Program from Educator</h3>"
#     body << "<p><i>(School not yet active)</i></p>"
#     body << "<p><b>School Name:</b> #{school_name}</p>"
#     body << "<p>#{school_address1}</p>"
#     body << "<p>#{school_address2}</p>"
#     body << "<p>#{school_city} #{state} #{school_zip}</p>"
#     body << "<p><b>Contact:</b> <b>#{first_name} #{last_name}</p>"
#     body << "<p><b>Email:</b> <b>#{email}</p>"
#     body << "<p><b>Phone:</b> <b>#{phone}</p>"
#
#     Pony.mail(
#       headers: { 'Content-Type' => 'text/html' },
#       to: 'skip@recountant.com',
#       from: 'no-reply@eCareerDirection.com',
#       subject: 'Request eCD Program from Educator',
#       body: body
#     )
#   end
  
  # def self.welcome(id, email, first_name, last_name, score1, score2)
  #
  # filename = "/student/reports/#{id}/mail_wel.erb"
  # context = binding
  #
  # Pony.mail(
  #   to: "#{email}",
  #   from: 'no-rely@eCareerDirection.com',
  #   subject: 'Welcome to eCareerDirection.',
  #   body: ERB.new(File.read(filename)).result(binding)
  #   )
  # end
  
  # body: ERB.new(File.read(filename)).result(render())
  
  def self.welcome(id, email, first_name, last_name, high1_show, high2_show)

    body = ""
    body << "<p style='font-size: 17px;'>Hello #{first_name} #{last_name}. Welcome to <b><i style='color: #55b99e;'>e</i>CareerDirection.</b></h3>"
    body << "<p style='font-size: 17px;'>Your personalized interest report indicates your main interest is <b>#{high1_show}</b> and your next interest is <b>#{high2_show}.</b> You can return to your account any time to see your scores and watch videos or take the exercise a second time.<br /></p>"
    body << "<p style='font-size: 17px;'>To access you student account again: <a href='https://www.ecareerdirection.com/student/report'><b><i style='color: #55b99e;'>e</i>CareerDirection</b></a></p>"
    body << "<p style='font-size: 17px;'><b><i style='color: #55b99e;'>e</i>CareerDirection</b> is presented by the <a href='http://www.nationalguard.com'><b>Army National Guard</b></a></p>"
    body << "<p style='font-size: 17px;'>Thanks for your participation.<br />The <span style='font-weight: 900; letter-spacing: -1px;'><i style='color: #55b99e;'>e</i>CareerDirection</span> Team<br /></p>"
    
  Pony.mail(
    headers: { 'Content-Type' => 'text/html' },
    to: "#{email}",
    from: 'no-reply@eCareerDirection.com',
    subject: 'Welcome to eCareerDirection',
    body: body
  )
  end
  
  
  # def self.studentreport
#     from = Email.new(email: 'Welcome@eCareerDirection.com')
#     to = Email.new(to: @student.email)
#     subject = 'This is your eCD full report'
#     content = Content.new(type: 'text/plain', value: 'This is your Full COG Report')
#     mail = SendGrid::Mail.new(from, subject, to, content)
#
#     mail.add_content(Content.new(type: 'text/html', value: '<html><body><h1>Welcome #{first_name}</h1><br />Here is your <b>Full COG Report.</b> <br /><br /></body></html>'))
#
#     attachment = Attachment.new
#     attachment.content = Base64.strict_encode64(File.read('http://localhost:4567/student/reports/18182/scores_full.pdf'))
#     attachment.type = 'application/pdf'
#     attachment.filename = 'COG Full Report.pdf'
#     attachment.disposition = 'attachment'
#     attachment.content_id = 'Full Report'
#     mail.add_attachment(attachment)
#
#     sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
#     response = sg.client.mail._('send').post(request_body: mail.to_json)
#     puts response.status_code
#     puts response.body
#     puts response.headers
#   end
  
end

