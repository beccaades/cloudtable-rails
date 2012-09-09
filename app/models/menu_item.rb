class MenuItem < ActiveRecord::Base
  attr_accessible :venue_id

  belongs_to :order_item
end
