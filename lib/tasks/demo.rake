namespace :demo do
  
  desc 'Creates demo data'
  task :data => :environment do
    Restaurant.delete_all
    Restaurant.create! :venue_id => "b3856d1115cfd3647211"    
  end
  
end
