# == Schema Information
#
# Table name: interests
#
#  id            :integer          not null, primary key
#  employer_id   :integer
#  student_id    :integer
#  who_initiated :string(255)
#  approved      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Interest < ActiveRecord::Base
  belongs_to :employer, :class_name => "User"
  belongs_to :student, :class_name => "User"
  belongs_to :who_initiated, :class_name => "User"
  attr_accessible :approved, :who_initiated_id, :employer_id, :student_id
end
