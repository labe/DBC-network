class Answer < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :text

  belongs_to :user
  belongs_to :question
end
