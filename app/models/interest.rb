class Interest < ActiveRecord::Base
  belongs_to :employer, :class_name => "User"
  belongs_to :student, :class_name => "User"
  belongs_to :who_initiated, :class_name => "User"
  attr_accessible :approved, :who_initiated_id, :employer_id, :student_id
end
