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

class Employer < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  attr_accessible :company_id, :user_id
end
