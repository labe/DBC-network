class InterestMailer < ActionMailer::Base
  default from: "dbcfinalproject@gmail.com" 


  def student_initiated_email(catcher,pitcher,responses)
    # These three lines are repeated for each email. Time to extract to a helper method
    time = Time.new
    full_time= time.strftime("%A %B %d")
    @time = "#{full_time}"
    @catcher = catcher
    @pitcher = pitcher
    @response = responses
    # Using _path helpers for emails won't work. The URLs will be relative, i.e. "/users"
    # in the context of an email, the browser needs a full URL, including the hostname i.e.
    # http://www.dbcalumni.com/users. You'll need to the use the _url helpers instead
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
