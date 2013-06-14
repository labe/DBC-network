class User < ActiveRecord::Base
  attr_accessible :access_key, :account_type_id, :avatar, :email, :first_name, :github_handle, :graduation_date, :intro, :last_login, :last_name, :location, :password_digest, :phone, :status

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password
end
