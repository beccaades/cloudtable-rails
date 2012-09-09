class Restaurant < ActiveRecord::Base

  has_many :tables

  attr_accessible :venue_id
  attr_accessor :name

  def load
    JSON.parse(Locu.find_venue(venue_id))
  end
end
