namespace :demo do
  
  desc 'Creates demo data'
  task :data => :environment do
    Restaurant.delete_all
    restaurant = Restaurant.create!   :venue_id => "b3856d1115cfd3647211"
    restaurant_2 = Restaurant.create! :venue_id => "03d5e63900761ffbc948"

    Table.delete_all
    Table.create!(:restaurant => restaurant, :token => 'abcde12345')
  end
  
end
