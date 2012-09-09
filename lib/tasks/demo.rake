namespace :demo do
  
  desc 'Creates demo data'
  task :data => :environment do
    Restaurant.delete_all
    Table.delete_all

    restaurant = Restaurant.create! :venue_id => "b3856d1115cfd3647211"
    Table.create!(:restaurant => restaurant, :token => 'abcde12345')
  end
  
end