require 'spec_helper'

describe Rating do
  
  before(:each) do
    Rating.delete_all
  end
  
  it "should rate a menu item" do
    Rating.count.should == 0
    order = Order.create!
    order_2 = Order.create!
    order_item = order.add_item(123)
    order_item_2 = order_2.add_item(123)
    
    Rating.create! :menu_item_id => 123, :order_item_id => order_item.id, :rating => 3
    Rating.create! :menu_item_id => 123, :order_item_id => order_item_2.id, :rating => 5

    Rating.for(123).should == 4
  end

end
