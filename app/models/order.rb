class Order < ActiveRecord::Base
  attr_accessible :restaurant_id, :status, :table_id, :user_id

  has_many :order_items
  belongs_to :restaurant
  belongs_to :table
  belongs_to :user

  def add_item
    
  end

  def remove_item
    
  end
end
