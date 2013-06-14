class Student < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user
  attr_accessible :cohort_id, :user_id
end
