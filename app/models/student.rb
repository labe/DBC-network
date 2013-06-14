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

class Student < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user
  attr_accessible :cohort_id, :user_id
end
