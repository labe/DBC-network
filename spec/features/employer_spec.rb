require 'spec_helper'
require 'sunspot/rails/spec_helper'

describe "Employer" do

	disconnect_sunspot

	context "while signed in" do 

	  before do 
 	  	@student = FactoryGirl.create(:user)
 	  	@student2 = FactoryGirl.create(:user, id: 3, email: "student2@student2.com")
 	  	@employer = FactoryGirl.create(:user, id:4, :groupable_type => "Company", email: "employer@employer.com")
 	  	visit root_path
 	  	fill_in "email", with: @employer.email
      fill_in "password", with: @employer.password
      click_button "Login"
 	  end
  
	  	it "has a profile page" do
	  		pending "need to create employer and company factory models"
	  		# visit user_path(@employer)
	  		# page.should have_content("#{@employer.first_name}")
	  	end
  
	  	it "can view all DBC participants" do
	  		pending "need to create cohort factory model"
	  		# visit users_path
	  		# page.should have_content('Student List')
	  	end
  
	  	it "can view DBC student/alumni contact info" do
	  		visit user_path(@student)
	  		page.should have_content('student@student.com')
	  	end
  
	  	it "can show interest in other users" do
	  		visit user_path(@student)
	  		page.should have_button 'Next-Step'
	  	end
  
	  	it "can contact via email other DBC alumni/students" do
	  		visit user_path(@student)
	  		click_button "Next-Step"
	  	end
	  end
  
	context "while not logged in" do 

		before do 
 	  	@student = FactoryGirl.create(:user)
 	  end
  
	  it "canNOT view DBC student/alumni info" do
	  	pending "page explodes if user tries to navigate manually without signing in"
	  	# visit user_path(@student)
	  	# current_path.should eq root_path
	  end
  
	end

end