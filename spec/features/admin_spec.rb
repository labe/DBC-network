require 'spec_helper'
#require 'sunspot/rails/spec_helper'

describe "Admin" do

	#disconnect_sunspot

	context "while signed in" do 
		before do
		  @student = FactoryGirl.create(:user)
      @student2 = FactoryGirl.create(:user, id: 3, activated: nil, email: "student2@student2.com")
      @company = FactoryGirl.create(:company, activated: false)
      @cohort = FactoryGirl.create(:cohort)
      @employer = FactoryGirl.create(:user, id: 4, groupable_type: "Company", 
      groupable_id: @company.id, email: "employer@employer.com")
			@admin = FactoryGirl.create(:user, id:5, :email => "admin@admin.com", :groupable_type => "Administration")
		  visit root_path
      fill_in "email", with: @admin.email
      fill_in "password", with: @admin.password
      click_button "Login"
		end

		it "has a dashboard" do
			visit admins_path
			page.should have_content('To-do')
		end

		it "can activate users" do
			pending
			# visit admins_path
			# within(".approval_button .link.green:nth-of-type(1)") do
			# 	click_button 'Activate'
			# end
	  end

	  it "can deactivate users" do 
 			pending
	  end

	  it "can approve companies" do
	  	pending
	  end

	  it "can view when a company and student connect" do 
 			visit admins_path
 			page.should have_content('Interests')
	  end

	  it "can view comapny questions and student answers" do
	  	visit admins_path
	  	page.should have_content('Questions')
	  end

	  it "can create a student" do
	  	pending
	  end

	  it "can create an employer" do
	  	pending
	  end

	  it "can create a company" do 
	  	visit admins_path
	  	fill_in 'company_name', with: 'fakecompany'
	  	fill_in 'company_location', with: 'Chicago'
	  	fill_in 'company_website', with: "www.fake.com"
	  	fill_in 'company_initial_email_contact', with: "Fake@gmail.com"
	  	click_button 'Create Company'
	  	expect{click_button 'Create Company'}.to change{Company.count}.to(3)
	  end

	  it "can create a cohort" do
	  	visit admins_path
	  	fill_in 'cohort_name', with: 'fakecompany'
	  	click_button 'Create Cohort'
	  	expect{click_button 'Create Cohort'}.to change{Cohort.count}.to(3)
	  end

	end

end