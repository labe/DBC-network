class Answer < ActiveRecord::Base
  attr_accessible :user_id, :user, :question_id, :question, :text

  belongs_to :user
  belongs_to :question
  
  validates_presence_of :text
end
