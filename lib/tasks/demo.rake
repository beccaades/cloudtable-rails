namespace :demo do
  
  desc 'Creates demo data'
  task :data => :environment do
    Restaurant.delete_all
    Restaurant.create! :venue_id => "b3856d1115cfd3647211"
    Restaurant.create! :venue_id => "03d5e63900761ffbc948"
  end
  
end
