class Order < ActiveRecord::Base
  attr_accessible :restaurant_id, :status, :table_id

  has_many :order_items
end
