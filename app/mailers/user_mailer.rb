class UserMailer < ActionMailer::Base
	default from: "DBConnect@gmail.com"


	def student_welcome_email(user)
		@user = user
		@url  = "http://DBConnect.com/login"
		mail(:to => user.email, :subject => "Welcome to DBConnect")
	end

	def employer_welcome_email(user)
		@user = user
		@url  = "http://DBConnect.com/login"
		mail(:to => user.email, :subject => "Welcome to DBConnect")
	end

	def pending_email(user)
		@user = user
		@url  = "http://DBConnect.com/login"
		mail(:to => user.email, :subject => "Welcome to DBConnect Your Application Is Pending Approval")
	end

end