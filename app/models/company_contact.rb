class CompanyContact < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :company

  attr_accessible :approved, :user, :company, :user_id, :company_id, :email_sent_on
end
