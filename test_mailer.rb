require 'dotenv'
require 'mail'

Dotenv.load

mail = Mail.new
mail.from    = ENV['EMAIL_FROM']
mail.to      = ENV['EMAIL_TO']
mail.subject = "test subject"
mail.body    = "test body"

smtp_params = {
  address: ENV['EMAIL_SERVER_ADDRESS'],
  port: ENV['EMAIL_PORT'],
  domain: ENV['EMAIL_DOMAIN'],
  user_name: ENV['EMAIL_USER_NAME'],
  password: ENV['EMAIL_PASSWORD'],
  authentication: :login,
  enable_tls: true
}

mail.delivery_method(:smtp, smtp_params)

begin
  mail.deliver
rescue StandardError => e
  puts "Error has occured: #{e.message}"
end
