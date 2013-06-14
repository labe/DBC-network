FactoryGirl.define do
	factory :student do
		access_key  			'12345Qu'   
		account_type_id		'1'
		avatar         		'/images/12354.jpg'
		email          		'Email@email.com'
		first_name     		'FirstName'
		github_handle  		'GithubHandleFoSho'
		graduation_date		'06/21/13'
		intro          		'I am an intro for a nice little fellow'
		last_login     		'06/15/13'
		last_name      		'LastName'
		location       		'Chicago,IL'
		password					'HashityHashHash'
		phone          		'555-230-9012'
		status         		'Active'

	end
end

FactoryGirl.define do
	factory :student2 do
		
		access_key  			'12345Qu'   
		account_type_id		'1'
		avatar         		'/images/12354.jpg'
		email          		'Email2@email.com'
		first_name     		'FirstName2'
		github_handle  		'GithubHandleFoSho'
		graduation_date		'06/21/13'
		intro          		'I am an intro for a nice little fellow'
		last_login     		'06/15/13'
		last_name      		'LastName2'
		location       		'Chicago,IL'
		password					'HashityHashHash'
		phone          		'555-230-9012'
		status         		'Active'

	end
end

FactoryGirl.define do
	factory :question do
		title "Ho Hum"
		body  "La Di da do da de da"
		user_id 1

	end
end