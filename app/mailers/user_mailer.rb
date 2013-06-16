# I spy some hard tabs in this file. They should be replaced with two
# spaces, to match the rest of your source.
class UserMailer < ActionMailer::Base
	default from: "DBCfinalproject@gmail.com"


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
