class Restaurant < ActiveRecord::Base
  attr_accessible :venue_id
  attr_accessor :name

  def load
    JSON.parse(Locu.find_venue(venue_id))
  end
end
