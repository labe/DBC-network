class User < ActiveRecord::Base
  attr_accessible :activated, :avatar, :email, :first_name, :github_handle, :graduation_date, :groupable_id, :groupable_type, :intro, :last_login, :last_name, :location, :password, :phone, :status

  belongs_to :groupable, :polymorphic => true

  has_many :user_interests, :class_name => "Interest", :foreign_key => :pitcher_id
  has_many :following_interests, :class_name => "Interest",  :foreign_key => :catcher_id

  has_many :interests, :through => :user_interests, :source => :catcher
  has_many :followers, :through => :following_interests, :source => :pitcher

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

end
