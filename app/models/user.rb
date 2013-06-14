# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  access_key      :string(255)
#  account_type_id :integer
#  avatar          :string(255)
#  email           :string(255)
#  first_name      :string(255)
#  github_handle   :string(255)
#  graduation_date :string(255)
#  intro           :text
#  last_login      :datetime
#  last_name       :string(255)
#  location        :string(255)
#  password_digest :string(255)
#  phone           :string(255)
#  status          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :access_key, :account_type_id, :avatar, :email, :first_name, :github_handle, :graduation_date, :intro, :last_login, :last_name, :location, :password_digest, :phone, :status

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password
end
