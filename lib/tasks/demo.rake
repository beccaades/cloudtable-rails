namespace :demo do
  
  desc 'Creates demo data'
  task :data => :environment do
    Restaurant.delete_all
    restaurant = Restaurant.create!   :venue_id => "b3856d1115cfd3647211"
    restaurant_2 = Restaurant.create! :venue_id => "03d5e63900761ffbc948"
    # restaurant_3 = Restaurant.create! :venue_id => "120dfe3bee655ec1fa66"

    Table.delete_all
    restaurant.tables.create!   :token => 'abcde12345'
    restaurant_2.tables.create! :token => '1234512345'
    # restaurant_3.tables.create! :token => '12345abcde'
  end
  
end
