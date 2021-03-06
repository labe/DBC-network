# == Schema Information
#
# Table name: cohorts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cohort < ActiveRecord::Base
  attr_accessible :name

  has_many :users, :as => :groupable

end
