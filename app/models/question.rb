class Question < ActiveRecord::Base
  attr_accessible :user_id, :text

  has_many :answers
  
  belongs_to :user
end
