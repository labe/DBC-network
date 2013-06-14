# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(:website => Faker::Internet.url,
               :name => Faker::Company.name,
               :location => "Chicago",
               :status => "active")
Cohort.create(:name => "Squirrels") 

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

20.times do
  employer_number = rand(11..20)
  student_number = rand(1..10)
  Interest.create(:pitcher_id => employer_number,
                  :catcher_id => student_number)
end
