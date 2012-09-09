class SubsectionItem

  attr_accessor :description, :name, :price, :type, :menu_item_id

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def load_menu_item_id(venue_address)
    response = Locu.find_menu_item_id(name, venue_address)
    self.menu_item_id = response["objects"].first["id"] if response.present?
  end

end
