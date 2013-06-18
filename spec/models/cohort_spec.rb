# == Schema Information
#
# Table name: cohorts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Cohort do
  	it { should be_instance_of(Cohort) }
  	it { should have_many(:users)}
end
