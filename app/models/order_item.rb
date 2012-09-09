class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :quantity, :menu_item_id, :order, :menu_item

  validates :menu_item, :order, :presence => :true

  belongs_to :order
  belongs_to :menu_item
end
