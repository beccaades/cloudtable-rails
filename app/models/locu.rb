class Locu

  API_KEY = "7fa9653a97e4be028ac85958b66df2d845e28485"

  def self.find_venue id
    RestClient.get "http://api.locu.com/v1_0/venue/#{id}/?api_key=#{API_KEY}"
  end

  def self.find_menu_item_id name, venue_address
    # RestClient.get "http://api.locu.com/v1_0/menu_item/search/?name=#{URI.encode(name)}&street_address=#{URI.encode(venue_address)}&api_key=#{API_KEY}")
    false
  end

end
