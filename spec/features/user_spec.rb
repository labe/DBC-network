require 'spec_helper'

describe User do
	
	before do 
		@student = FactoryGirl.create(:student)
		@company = FactoryGirl.create(:company)
	end

	it "can log in" do
		visit root_path
		click_link "Log in"
		fill_in 'email', with: @student.email	
		fill_in 'password', with: @student.password
		click_button 'Login'
		page.should have_content("Welcome to DBConnect #{user.first_name}")
	end

	it "can signup as company" do
		visit root_path
		click_button "Add my company"
		fill_in 'name', with: @company.name
		fill_in 'website', with: @company.website
		fill_in 'initial_email_contact', with: @company.email
		click_button 'Request'
		page.should have_content("Welcome to DBConnect #{@company.name}. We will notify when you have been approved.")
	end

		it "can signup as an alumni" do
		visit root_path
		click_button "I'm a DBC Alumni"
		fill_in 'email', with: @student.email	
		fill_in 'password', with: @student.password
		click_button 'Sign Up'
		page.should have_content("Welcome to DBConnect #{@student.first_name}. We'll notfiy you when your account has been approved.")
	end


end