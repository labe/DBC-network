# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


AccountType.create(:name => "student")
AccountType.create(:name => "employer")
Company.create(:website => Faker::Internet.url,
               :name => Faker::Company.name,
               :location => "Chicago",
               :status => "active")
Cohort.create(:name => "Squirrels") 

10.times do
  User.create(:access_key => "password",
              :account_type_id => 1,
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

10.times do
  User.create(:access_key => "password",
              :account_type_id => 2,
              :email => Faker::Internet.email,
              :first_name => Faker::Name.first_name,
              :location => "San Francisco", 
              :last_login => DateTime.new(2001,2,3),
              :last_name => Faker::Name.last_name,
              :password => "password",
              :status => "active")
end

10.times do 
  Employer.create(:company_id => 1, :user_id => rand(11..20))
end

10.times do 
  Student.create(:cohort_id => 1, :user_id => rand(1..10))
end

20.times do
  employer_number = rand(11..20)
  student_number = rand(1..10)
  Interest.create(:employer_id => employer_number,
              :student_id => student_number,
              :who_initiated_id => [employer_number,student_number].sample)
end
