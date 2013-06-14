# == Schema Information
#
# Table name: employers
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Employer do

		it { should be_instance_of(Employer)}

end
