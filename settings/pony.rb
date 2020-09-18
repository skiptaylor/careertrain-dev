Pony.options = {
  via: :smtp,
  via_options: {
    address: 'smtp.sendgrid.net',
    port: '587',
    domain: 'heroku.com',
    user_name: 'apikey',
    password: ENV['SENDGRID_PASSWORD'],
    authentication: :plain,
    enable_starttls_auto: true
  }
}
