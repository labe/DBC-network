class Company < ActiveRecord::Base
  attr_accessible :activated, :location, :logo, :name, :status, :website, :initial_email_contact

  has_many :users, :as => :groupable
  has_many :questions

  # mount_uploader :logo, LogoUploader

  searchable do
    text :location, :name, :website
  end

end
