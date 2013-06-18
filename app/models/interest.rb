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
  belongs_to :pitcher, :class_name => "User", :foreign_key => "pitcher_id"
  belongs_to :catcher, :class_name => "User", :foreign_key => "catcher_id"

  attr_accessible :approved, :pitcher_id, :catcher_id, :email_sent
end
