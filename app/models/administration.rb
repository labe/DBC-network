class Administration < ActiveRecord::Base
  attr_accessible :name

  has_many :users, :as => :groupable

end
