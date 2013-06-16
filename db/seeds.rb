
# Create an admin
  User.create(:activated => true,
              :first_name => "Admin first",
              :last_name => "Admin last",
              :groupable_type => "Admin",
              :email => "admin@admin.com",
              :password => "password")


# Create a company
Company.create(:website => Faker::Internet.url,
               :name => Faker::Company.name,
               :location => "Chicago",
               :status => "active")

# Create a cohort
Cohort.create(:name => "Squirrels")

#Create 10 active students
10.times do
  User.create(:groupable_id => 1,
              :groupable_type => "Cohort",
              :email => Faker::Internet.email,
              :first_name => Faker::Name.first_name,
              :github_handle => "fakegithubaccount",
              :graduation_date => "2013",
              :intro => Faker::Lorem.paragraph(sentence_count = 3),
              :location => "Chicago",
              :last_login => DateTime.new(2001,2,3),
              :last_name => Faker::Name.last_name,
              :password => "password",
              :phone => Faker::PhoneNumber.phone_number,
              :status => "active")
end

# Create 10 active employers
10.times do
  User.create(:groupable_id => 1,
              :groupable_type => "Company",
              :email => Faker::Internet.email,
              :first_name => Faker::Name.first_name,
              :location => "San Francisco",
              :last_login => DateTime.new(2001,2,3),
              :last_name => Faker::Name.last_name,
              :password => "password",
              :status => "active")
end

# Create 20 interest relationships
20.times do
  employer_number = rand(11..20)
  student_number = rand(1..10)
  Interest.create(:pitcher_id => employer_number,
                  :catcher_id => student_number)
end

# Create 10 inactive students
10.times do
  User.create(:groupable_id => 1,
              :groupable_type => "Cohort",
              :email => Faker::Internet.email,
              :first_name => Faker::Name.first_name,
              :github_handle => "fakegithubaccount",
              :graduation_date => "2013",
              :intro => Faker::Lorem.paragraph(sentence_count = 3),
              :location => "Chicago",
              :last_login => DateTime.new(2001,2,3),
              :last_name => Faker::Name.last_name,
              :password => "password",
              :phone => Faker::PhoneNumber.phone_number,
              :status => "inactive")
end

# Create 10 inactive employers
10.times do
  User.create(:groupable_id => 1,
              :groupable_type => "Company",
              :email => Faker::Internet.email,
              :first_name => Faker::Name.first_name,
              :location => "San Francisco",
              :last_login => DateTime.new(2001,2,3),
              :last_name => Faker::Name.last_name,
              :password => "password",
              :status => "active")
end

# Create 5 questions for an employer (id = 11)
5.times do 
  Question.create(:user_id => 20,
                  :text => "#{Faker::Lorem.sentence}?")
end

# Create 5 answers for a student (id =)
5.times do
  Answer.create(:user_id => 9,
                :question_id => 1,
                :text => Faker::Lorem.sentence)
end
