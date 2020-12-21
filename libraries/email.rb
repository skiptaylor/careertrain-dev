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

  def self.requestcd2(school_name, school_address1, school_address2, school_city, school_state, school_zip, first_name, last_name, email, phone, fax)

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
      to: 'info@ecareertrain.com, skip@recountant.com',
      from: 'no-reply@eCareerDirection.com',
      subject: 'Request eCD Program from Educator',
      body: body
    )
  end
  
  def self.fullreport(to, first_name, last_name)
    body = ""
    body << "<p>Welcome #{first_name} #{last_name} to eCareerDirecrion</p>"
    body << "<p>Here is your Full COG Report.</p>"
    body << "<p>We wish you the best!</p>"
    
    
    
    # attachment = Attachment.new
#     attachment.content = Base64.strict_encode64(File.read('http://localhost:4567/student/reports/18182/scores_full.pdf'))
#     attachment.type = 'application/pdf'
#     attachment.filename = 'COG Full Report.pdf'
#     attachment.disposition = 'attachment'
#     attachment.content_id = 'Full Report'
#     mail.add_attachment(attachment)
    
  Pony.mail(
    headers: { 'Content-Type' => 'text/html' },
    to: to,
    from: 'Welcome@eCareerDirection.com',
    subject: 'Welcome. This is your eCD full report',
    body: body
  )
        
  end
  
end

