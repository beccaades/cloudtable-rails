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
    order_item_2 = order.add_item(321)
    order_item_3 = order_2.add_item(123)
    
    Rating.create! :menu_item_id => 123, :order_item_id => order_item.id,   :score => 3
    Rating.create! :menu_item_id => 321, :order_item_id => order_item_2.id, :score => 1
    Rating.create! :menu_item_id => 123, :order_item_id => order_item_3.id, :score => 5

    Rating.for(123).should == 4
    Rating.for(321).should == 1
  end

end
