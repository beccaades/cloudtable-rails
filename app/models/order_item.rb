class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :quantity, :menu_item_id, :order

  validates :order, :presence => true
  
  before_create :check_quantity

  belongs_to :order

  def check_quantity
    puts OrderItem.all.inspect
    puts menu_item_id
    puts OrderItem.find_by_menu_item_id(menu_item_id)
    order_item = OrderItem.find_by_menu_item_id(menu_item_id)
    if order_item.present?
      order_item.update_attribute(:quantity, order_item.quantity += 1)
    else
      puts "lalal"
      errors.add(:base, "error")
    end
  end
end
