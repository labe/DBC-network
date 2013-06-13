class Student < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user
  # attr_accessible :title, :body
end
