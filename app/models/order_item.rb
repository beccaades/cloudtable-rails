class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :quantity, :menu_item_id, :order, :menu_item

  belongs_to :order
  belongs_to :menu_item
end
