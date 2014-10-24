class Email

  def self.reset(to, password)
    body = ""
    body << '<p>Your Password: #{password}</p>'

    Pony.mail(headers: { 'Content-Type' => 'text/html' },
                   to: to,
                 from: 'no-reply@careertrain.com',
              subject: 'Account Reset',
                 body: body)
  end

end
