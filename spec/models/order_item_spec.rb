require 'spec_helper'

describe OrderItem do
  
  before(:each) do
    Order.delete_all
    OrderItem.delete_all
  end
  
  it "should create a new order item" do
    Order.count.should == 0
    OrderItem.count.should == 0

    order = Order.create!
    order.order_items.create(:menu_item_id => "1234")

    Order.count.should == 1
    OrderItem.count.should == 1
  end

  it "should handle quantity" do

    Order.count.should == 0
    OrderItem.count.should == 0

    order = Order.create!
    order_item = order.order_items.create(:menu_item_id => "1234")

    order_item.quantity.should == 1

    Order.count.should == 1
    OrderItem.count.should == 1

    order_item_2 = order.order_items.create(:menu_item_id => "1234")
    order_item.reload.quantity.should == 2

    order_item = order.order_items.create(:menu_item_id => "4321")
    order_item.quantity.should == 1

    OrderItem.count.should == 2
  end
end
