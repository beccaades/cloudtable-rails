class Rating < ActiveRecord::Base
  attr_accessible :menu_item_id, :ordem_item_id, :score, :user_id
end
