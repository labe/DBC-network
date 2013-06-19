class UserMailer < ActionMailer::Base
	default from: "DBCfinalproject@gmail.com"
  # Fix the indentation in this file

	def student_welcome_email(user)
		@user = user
		# Using _path helpers for emails won't work. The URLs will be relative, i.e. "/users"
        # in the context of an email, the browser needs a full URL, including the hostname i.e.
        # http://www.dbcalumni.com/users. You'll need to the use the _url helpers instead
		@url  = log_in_path
		mail(:to => user.email, :subject => "Welcome to DBConnect")
	end

	def employer_welcome_email(user)
		@user = user
		@url  = log_in_path
		@feedback_url = "DBCfinalprojectfeedback.com"
		mail(:to => user.email, :subject => "Welcome to DBConnect")
	end

	def pending_email(user)
		@user = user
		@url  = log_in_path
		mail(:to => user.email, :subject => "Welcome to DBConnect Your Application Is Pending Approval")
	end

	def denial_email(user)
		@user = user
		@url = root_path
		mail(:to => user.email, :subject => "DBConnect Approval Status")
	end

  def employer_miss_us_email(user)
  	@user = user
  	@urls = root_path
  	mail(:to => user.email, :subject => "We Miss You!")
  end

end