# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  cohort_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Student do

	it { should be_instance_of(Student) }
	
end
