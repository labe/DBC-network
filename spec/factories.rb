FactoryGirl.define do
		
	factory :company do 
		id 1
		website "www.devbootcamp.com"
		name "Dev Bootcamp Inc."
		logo "/images/devbootcamp.jpg"
		location 'Chicago'
		status "active"
		initial_email_contact "DBCfinalproject@gmail.com"
	end

	factory :cohort do 
		id 1
		name "Squirrels"
	end

	factory :user do
		id 1
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

	factory :administration do
		name "Administration"
	end

	# factory :employer do |employer|
 #  	#attributes for employer
 #  	user
 #  	association :groupable, factory: :use
 #  	id 2
 #  	groupable_type "Company"
 #  	employer.after_create {|a| Factory(:user, :groupable => a)}
	# end

	factory :git_hub_selection do
		name "my_cool_repo"
		url "www.github.com/BooneTeam/repos"
	end

	factory :question do
		user_id 4
		text "question_1"
		status "active"
	end

	factory :answer do 
		question_id 1 
		text "answer_1"
	end

end