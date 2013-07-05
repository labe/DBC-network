require 'spec_helper'
#require 'sunspot/rails/spec_helper'

describe User do
	
	#disconnect_sunspot 
	
	context "while not signed in" do 
	  
	  before do 
	  	@student = FactoryGirl.create(:user)
	  	@company = FactoryGirl.create(:company)
	  	@cohort = FactoryGirl.create(:cohort)
	  	@employer = FactoryGirl.create(:user, id: 4, groupable_type: "Company", 
	  		groupable_id: @company.id, email: "employer@employer.com")
	  end
  
	  it "can log in as student" do
	  	visit root_path
	  	fill_in 'email', with: @student.email	
	  	fill_in 'password', with: @student.password
	  	click_button "Login"
	  	page.should have_content("Mentors")
	  end
  
	  it "can log in as employer" do
	  	visit  root_path
	  	fill_in 'email', with: @employer.email	
	  	fill_in 'password', with: @employer.password
	  	click_button 'Login'
	  	page.should have_content("Squirrels")
	  end
  
	  it "can log in as company admin" do
	  	pending "feature not approved yet"
	  end
  
	  it "can signup as employer" do
	  	visit sign_up_path
	  	click_link "Employer"
	  	fill_in 'user_first_name', with: "employer_first_name"
	  	fill_in 'user_last_name', with: "employer_last_name"
	  	fill_in 'user_password', with: "password"
	  	fill_in 'user_email', with: "fake@fake.com"
	  	click_button 'Signup'
	  	page.should have_content("Employer created successfully")
	  end
  
	  it "can signup as an alumni" do
	  	visit sign_up_path
	  	click_link "Alumni"
	  	fill_in 'user_email', with: "fake@fake.com"
	  	fill_in 'user_password', with: "password"
	  	fill_in 'user_first_name', with: "user_first_name"
	  	fill_in 'user_last_name', with: "user_last_name"
	  	click_button 'Signup'
	  	page.should have_content("Alumni profile created!")
	  end

  end

  context "while not signed in" do 
    
    before do 
	  	@student = FactoryGirl.create(:user)
	  end

		it "is not able to view users" do 
			pending
			# visit user_path(@student)
			# current_path.should == root_path
		end

  end

end