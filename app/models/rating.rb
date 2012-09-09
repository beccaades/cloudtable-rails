class Rating < ActiveRecord::Base
  attr_accessible :menu_item_id, :order_item_id, :score, :user_id

  def self.for(menu_item_id)
    where(:menu_item_id => menu_item_id).average("score").to_f
  end
end
