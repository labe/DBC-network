require 'spec_helper'
require 'sunspot/rails/spec_helper'

describe GitHubSelection do

	disconnect_sunspot

	it { should be_instance_of(GitHubSelection) }
	it { should belong_to(:user) }
	
	it "should not allow more than 5 per user" do
		pending "this may go into the user model tests"
	end

end
