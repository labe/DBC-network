class User < ActiveRecord::Base
  attr_accessible :activated, :email, :facebook_url, :first_name, :github_handle, :graduation_date, :groupable_id, :groupable_type, :intro, :last_login, :last_name, :linkedin_url, :location, :password, :phone, :status, :twitter_url, :tumblr_url

  belongs_to :groupable, :polymorphic => true

  has_many :user_interests, :class_name => "Interest", :foreign_key => :pitcher_id
  has_many :following_interests, :class_name => "Interest",  :foreign_key => :catcher_id

  has_many :interests, :through => :user_interests, :source => :catcher
  has_many :followers, :through => :following_interests, :source => :pitcher

  has_many :questions
  has_many :answers
  
  accepts_nested_attributes_for :questions, :allow_destroy => true
  accepts_nested_attributes_for :answers, :allow_destroy => true

  has_many :git_hub_selections

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  searchable do
    text :first_name, :boost => 5
    text :last_name,  :boost => 5
    text :email,      :boost => 5
    text :location,   :boost => 4
    text :github_handle, :graduation_date, :groupable_type, :phone
  end

end
