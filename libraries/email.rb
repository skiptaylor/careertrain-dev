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

  def self.requestcd2 school_name, school_address1, school_address2, school_city, school_state, school_zip, first_name, last_name, email, phone, fax

    body = ''
    body << "<h4>Request CD2 Program from Educator</h4>"
    body << "<p>School Name: #{school_name}</p>"
    body << "<p>#{school_address1}</p>"
    body << "<p>#{school_address2}</p>"
    body << "<p>#{school_city} #{school_state} #{school_zip}</p>"
    body << "<p>Contact: #{first_name} #{last_name}</p>"
    body << "<p>Email: #{email}</p>"
    body << "<p>Phone: #{phone}</p>"
    body << "<p>Fax: #{fax}</p>"

    Pony.mail(
      headers: { 'Content-Type' => 'text/html' },
      to: 'info@careertrain.com, tayloraid@gmail.com',
      from: 'no-reply@eCareerDirection.com',
      subject: 'Request eCD Program from Educator',
      body: body
    )
  end
  
  def fullreport
    mail = SendGrid::Mail.new
    mail.from = Email.new(email: 'no-reply@eCareerDirection.com')
    mail.subject = 'eCD Full Report'
    
    personalization = Personalization.new
    personalization.add_to(Email.new(email: '#{@student.email}', name: '#{@student.first_name}, #{@student.last_name}'))
    
    attachment = Attachment.new
    attachment.content = 'https://ecareerdirection.com/student/reports/<%= @student.id %>/scores_full'
    attachment.type = 'application/pdf'
    attachment.filename = 'COG Report.pdf'
    attachment.disposition = 'attachment'
    attachment.content_id = 'Report'
    mail.add_attachment(attachment)
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
    
  end
  
end