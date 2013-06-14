# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  website    :string(255)
#  name       :string(255)
#  logo       :string(255)
#  location   :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Company do

	it { should be_instance_of(Company) }


end
