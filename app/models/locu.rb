class Locu

  API_KEY = "7fa9653a97e4be028ac85958b66df2d845e28485"

  def self.find_venue id
    response = RestClient.get "http://api.locu.com/v1_0/venue/#{id}/?api_key=#{API_KEY}"
  end

end
