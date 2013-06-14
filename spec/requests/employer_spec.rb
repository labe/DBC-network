require 'spec_helper'

describe "Employer" do

	

	context "while signed in" do 

	# before do 
	# 	sign_in
	# end
	before do 
 		@student2 = FactoryGirl.create(:student)
 		@company = FactoryGirl.create(:company)
 	end

	let(:student2) { FactoryGirl.create(Student) }

		it "has a profile page" do
			visit employer_path(employer)
			page.should have_content("#{employer.name} Profile Page")
		end

		it "can view all DBC participants" do
			visit student_index
			page.should have_content('All Students')
		end

		it "can view DBC student/alumni profiles" do
			visit student_path(student2)
			page.should have_content('Profile Page')
		end

		it "can view DBC student/alumni contact info" do
			visit student_path(student2)
			page.should have_content('contact info')
		end

		it "can view other DBC student/alumni statuses" do
			visit student_path(student2)
			page.should have_content('active')
		end

		it "can follow/show interest in other users" do
			visit student_path(student2)
			click_link("Follow").should change(student.following, :count).by(1)
		end

		it "can contact via email other DBC alumni/students" do
			visit student_path(student2)
			click_link "Contact"
			current_path.should == student_contact_path
		end
	end

	context "while not logged in" do 

		it "canNOT view DBC student/alumni info" do
			visit student_path(student2)
			current_path.should eq root_path
		end

	end

end