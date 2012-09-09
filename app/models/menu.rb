class Menu
  
  attr_accessor :name, :sections, :subsections

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end