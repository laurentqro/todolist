# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Todolist::Application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: EMAIL_USERNAME,
  password: EMAIL_PASSWORD,
  address: 'smtp.gmail.com',
  port: 587,
  authentication: 'plain',
  enable_starttls_auto: true
   }
