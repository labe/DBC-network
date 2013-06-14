class EmployerMailer < ActionMailer::Base
  default from: "DBConnect@gmail.com"


   def welcome_email(user)
    @user = user
    @url  = "http://DBConnect.com/login"
    mail(:to => user.email, :subject => "Welcome to DBConnect")
  end

end
