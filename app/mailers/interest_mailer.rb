class InterestMailer < ActionMailer::Base
  default from: "DBConnect@gmail.com" 


  def student_initiated_email(user)
    @user = user
    @url  = "http://DBConnect.com/login"
    mail(:to => user.email, :subject => "Someone's Interested")
  end

  def employer_initiated_email(user)
    @user = user
    @url  = "http://DBConnect.com/login"
    mail(:to => user.email, :subject => "Someone's Interested")
  end 

end
