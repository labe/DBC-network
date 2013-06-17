# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  website    :string(255)
#  name       :string(255)
#  logo       :string(255)
#  location   :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :location, :logo, :name, :status, :website, :initial_email_contact

  has_many :users, :as => :groupable
  
  searchable do
    text :location, :name, :website
  end

end
