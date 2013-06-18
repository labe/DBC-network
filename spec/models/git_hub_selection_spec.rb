require 'spec_helper'
require 'sunspot/rails/spec_helper'

describe GitHubSelection do

	disconnect_sunspot

	before do
		@student = FactoryGirl.create(:user)
		@git_hub_selection = FactoryGirl.create(:git_hub_selection)
		@git_hub_selection.user_id = @student.id
	end


	it { should be_instance_of(GitHubSelection) }
	it { should belong_to(:user) }


end
