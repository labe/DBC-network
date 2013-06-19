class Interest < ActiveRecord::Base
  belongs_to :pitcher, :class_name => "User", :foreign_key => "pitcher_id"
  belongs_to :catcher, :class_name => "User", :foreign_key => "catcher_id"

  attr_accessible :approved, :pitcher_id, :catcher_id, :email_sent_on
end
