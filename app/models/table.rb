class Table < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :restaurant_id, :token
end
