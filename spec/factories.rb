FactoryGirl.define do
	factory :user do
		activated  true
		email  "student@student.com"
		facebook_url  "www.facebook.com/student"
		first_name "Garrett"
		github_handle  "BooneTeam"
		graduation_date  "2013"
		groupable_id  1
		groupable_type  "Cohort"
		intro  "I am an intro"
		last_login  "5/12/2013"
		last_name  "Boone"
		linkedin_url  "www.linkedin.com/student"
		location  "Chicago"
		password  "password"
		phone "555-555-5555"
		status  "active"
		tumblr_url  "www.tumblr.com/student"
		twitter_url  "www.twitter.com/student"
	end
end