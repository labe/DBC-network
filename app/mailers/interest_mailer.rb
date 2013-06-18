class InterestMailer < ActionMailer::Base
  default from: "dbcfinalproject@gmail.com" 


  def student_initiated_email(catcher,pitcher,responses)
    time = Time.new
    full_time= time.strftime("%A %B %d")
    @time = "#{full_time}"
    @catcher = catcher
    @pitcher = pitcher
    @response = responses
    @url = log_in_path
    mail(:to => catcher.email, :reply_to => pitcher.email, :subject => "Someone's Interested")
  end

  def employer_initiated_email(catcher,pitcher)
    time = Time.new
    full_time= time.strftime("%A %B %d")
    @time = "#{full_time}"
    @catcher = catcher
    @pitcher = pitcher
    @url  = log_in_path
    mail(:to => catcher.email, :reply_to => pitcher.email, :subject => "Someone's Interested")
  end 

  def s2s_pending_connection(catcher,pitcher)
    time = Time.new
    full_time= time.strftime("%A %B %d")
    @time = "#{full_time}"
    @catcher = catcher
    @pitcher = pitcher
    @url = log_in_path
    mail(:to => catcher.email, :reply_to => pitcher.email, :subject => "Another DBC Alumni Wants to Connect With You.")
  end

end
