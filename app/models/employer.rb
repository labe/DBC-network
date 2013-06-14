class Employer < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  attr_accessible :company_id, :user_id
end
