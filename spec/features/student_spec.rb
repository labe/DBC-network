require 'spec_helper'
#require 'sunspot/rails/spec_helper'
describe "Student" do

	#disconnect_sunspot

	context "while signed in" do


  before do 
    @student = FactoryGirl.create(:user)
    @student2 = FactoryGirl.create(:user, id: 3, email: "student2@student2.com")
    @company = FactoryGirl.create(:company)
    @cohort = FactoryGirl.create(:cohort)
    @employer = FactoryGirl.create(:user, id: 4, groupable_type: "Company", 
    groupable_id: @company.id, email: "employer@employer.com")
    visit root_path
    fill_in "email", with: @student.email
    fill_in "password", with: @student.password
    click_button "Login"
 	end

		it "has a profile page" do
			visit user_path(@student)
			page.should have_content("#{@student.first_name}")
		end

		it "can view all DBC participants" do
			visit users_path
			page.should have_content('Students')
		end

		it "can view other DBC student/alumni profiles" do
			visit user_path(@student2)
			page.should have_content("#{@student2.first_name}")
		end

		it "can contact via email other DBC alumni/students" do
			visit user_path(@student2)
			click_button "Connect"
		end

	end


end