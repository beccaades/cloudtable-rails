class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :quantity, :menu_item_id, :order

  validates :order, :presence => true
  belongs_to :order

end
