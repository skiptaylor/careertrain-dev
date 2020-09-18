Pony.options = {
  via: :smtp,
  via_options: {
    address: 'smtp.sendgrid.net',
    port: '587',
    domain: 'heroku.com',
    user_name: 'eCDpony',
    password: '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',
    authentication: :plain,
    enable_starttls_auto: true
  }
}
