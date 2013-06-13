class Company < ActiveRecord::Base
  attr_accessible :location, :logo, :name, :status, :website
end
