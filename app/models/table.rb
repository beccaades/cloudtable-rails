class Table < ActiveRecord::Base

  belongs_to :restaurant
  has_many :orders
  attr_accessible :restaurant_id, :token, :restaurant

  def last_order
    orders.last if orders.any? and orders.last.present?
  end
  
end