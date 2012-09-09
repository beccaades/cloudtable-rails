object resource

node(:order) {|table| table.last_order }

child :restaurant do
  extends "restaurants/show"
end