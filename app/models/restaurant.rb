class Restaurant < ActiveRecord::Base
  attr_accessible :venue_id
  attr_accessor :name

  def load
    response = JSON.parse(Locu.find_venue(venue_id))
    
    self.name = response["objects"].first["name"]
  end
end
