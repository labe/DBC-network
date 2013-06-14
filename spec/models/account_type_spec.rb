# == Schema Information
#
# Table name: account_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe AccountType do
  	it { should be_instance_of(AccountType) }
end
