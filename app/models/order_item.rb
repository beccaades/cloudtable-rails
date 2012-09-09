class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :quantity, :menu_item_id, :order

  validates :order, :presence => true
  
  before_create :check_quantity

  belongs_to :order

  def check_quantity
    order_item = OrderItem.find_by_menu_item_id(menu_item_id)
    if order_item.present?
      order_item.update_attribute(:quantity, order_item.quantity += 1)
      return false
    end
  end
end
