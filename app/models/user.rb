class User < ActiveRecord::Base
  attr_accessible :access_key, :account_type_id, :avatar, :email, :first_name, :github_handle, :graduation_date, :intro, :last_login, :last_name, :location, :password_digest, :phone, :status
end
