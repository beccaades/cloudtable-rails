class Order < ActiveRecord::Base
  attr_accessible :restaurant_id, :status, :table_id, :user_id

  has_many :order_items
  belongs_to :restaurant
  belongs_to :table
  belongs_to :user

  def add_item(menu_item_id)
    order_item = OrderItem.find_by_menu_item_id_and_order_id(menu_item_id, self.id)

    if order_item.present?
      order_item.update_attribute(:quantity, order_item.quantity+1)
    else
      order_item = order_items.create! :menu_item_id => menu_item_id
    end

    order_item
  end

  def remove_item(menu_item_id)
    order_item = OrderItem.find_by_menu_item_id_and_order_id(menu_item_id, self.id)

    if order_item.present?
      order_item.update_attribute(:quantity, order_item.quantity-1)
      order_item = order_item.destroy if order_item.quantity == 0
    else
      order_item = order_items.find_by_menu_item_id(menu_item_id).destroy
    end

    order_item
  end
end
