class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :quantity, :menu_item_id, :order, :menu_item

  validates :menu_item, :order, :presence => :true

  before_create :check_quantity

  belongs_to :order
  belongs_to :menu_item

  def check_quantity
    order_item = OrderItem.find_by_menu_item_id(menu_item_id)
    if order_item.present?
      order_item.update_attribute(:quantity, order_item.quantity += 1)
    else
      return true
    end
  end
end
