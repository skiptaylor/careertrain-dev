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
  
  def self.fullreport
    from = Email.new(email: 'no-reply@eCareerDirection.com')
    to = Email.new(email: 'skip@recountant.com')
    subject = 'This is your eCD full report'
    content = Content.new(type: 'text/plain', value: 'This is your Full COG Report')
    mail = SendGrid::Mail.new(from, subject, to, content)
    # attachment = Attachment.new
    
    mail.add_content(Content.new(type: 'text/html', value: '<html><body><h1>Welcome <%= @student.first_name %></h1><br />Here is your <b>Full COG Report.</b> <br /><br /></body></html>'))
    
    # attachment.content = Base64.strict_encode64(File.open('/Users/Skip/Sites/careertrain-dev/ABcopy.pdf', 'rb').read)
#     attachment.type = 'application/pdf'
#     attachment.filename = 'AB Full Report.pdf'
#     attachment.disposition = 'attachment'
#     attachment.content_id = 'Full Report'
#     mail.add_attachment(attachment)
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
        
  end
  
end

# @student.first_name

# /Users/Skip/Sites/careertrain-dev/AB.pdf