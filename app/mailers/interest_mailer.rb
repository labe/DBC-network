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

  def s2s_pending_connection(catcher,pitcher)
    time = Time.new
    full_time= time.strftime("%A %B %d")
    @time = "#{full_time}"
    @catcher = catcher
    @pitcher = pitcher
    @url = "http://DBConnect.com/login"
    mail(:to => catcher.email, :subject => "Another DBC Alumni Wants to Connect With You.")
  end

end
