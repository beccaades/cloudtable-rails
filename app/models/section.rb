class Section
  
  attr_accessor :name, :subsections_items

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end