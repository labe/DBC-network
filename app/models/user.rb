class User < ActiveRecord::Base
  attr_accessible :activated, :company_name, :email, :facebook_url, :first_name, :github_handle, :graduation_date, :groupable_id, :groupable_type, :intro, :last_login, :last_name, :linkedin_url, :location, :password, :phone, :status, :twitter_url, :tumblr_url

  belongs_to :groupable, :polymorphic => true

  has_many :user_interests, :class_name => "Interest", :foreign_key => :pitcher_id
  has_many :following_interests, :class_name => "Interest",  :foreign_key => :catcher_id

  has_many :interests, :through => :user_interests, :source => :catcher
  has_many :followers, :through => :following_interests, :source => :pitcher

  has_many :company_contacts

  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :questions, :allow_destroy => true
  accepts_nested_attributes_for :answers, :allow_destroy => true

  has_many :git_hub_selections

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  def find_homepage(group)
    case group
    when "Cohort"
      {:path => "companies"}
    when "Company"
      {:path => "users", :options => "(:student => 'student')" }
    when "Administration"
      {:path => "admins"}
    end

  end

end
