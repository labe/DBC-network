class Interest < ActiveRecord::Base
  belongs_to :employer
  belongs_to :student
  attr_accessible :approved, :who_initiated
end
