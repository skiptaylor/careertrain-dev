class Email

  def self.welcome(to, name, email, policy)
    body = ""
    body << '<p>This is line one.</p>'
    body << '<p>This is line two.</p>'

    Pony.mail(headers: { 'Content-Type' => 'text/html' },
                   to: to,
                 from: 'no-reply@careertrain.com',
              subject: 'Welcome to careertrain.com',
                 body: body)
  end

end
