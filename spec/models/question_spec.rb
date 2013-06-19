require 'spec_helper'

describe Question do
  it { should be_instance_of(Question) }
  it { should have_many(:answers) }
  it { should belong_to(:user) }
end
