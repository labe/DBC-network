# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  access_key      :string(255)
#  account_type_id :integer
#  email           :string(255)
#  first_name      :string(255)
#  github_handle   :string(255)
#  graduation_date :string(255)
#  intro           :text
#  last_login      :datetime
#  last_name       :string(255)
#  location        :string(255)
#  password_digest :string(255)
#  phone           :string(255)
#  status          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'
require 'sunspot/rails/spec_helper'

describe User do

disconnect_sunspot

	context "has the relation to" do
		it { should be_instance_of(User) }
		it { should belong_to(:groupable) }
		it { should have_many(:user_interests) }
		it { should have_many(:following) }
		it { should have_many(:interests) }
		it { should have_many(:followers) }
		it { should have_many(:questions) }
		it { should have_many(:answers) }
		it { should have_many(:git_hub_selections) }
	end

	context "validation" do

		before do 
			@student = FactoryGirl.create(:user)
		end	

		it "does not allow invalid emails" do
			@student.email = "Bo2@c.o#m"
			@student.should_not be_valid
		end

		it "allows valid email" do
			@student.should be_valid
		end

		it "does not allow duplicate emails" do
			@student2 = FactoryGirl.create(:user, :email => "bones@bones.com", :id => 2)
			@student2.email = ("student@student.com")
			@student2.should_not be_valid
		end

		it "checks for presence of password" do
			pending "needs to be implemented"
		end

		it "checks format of password" do
			pending "needs to be implemented"
		end

	end

end
