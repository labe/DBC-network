class Question < ActiveRecord::Base
  attr_accessible :user_id, :company_id, :text, :status

  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  belongs_to :user
  belongs_to :company
end
