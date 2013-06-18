require 'spec_helper'
require 'sunspot/rails/spec_helper'

describe GitHubSelection do

	  disconnect_sunspot

  it { should be_instance_of(GitHubSelection) }

  before do
	p  @student = FactoryGirl.create(:user)
  end


end
