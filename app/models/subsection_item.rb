class SubsectionItem

  attr_accessor :description, :name, :price, :type

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end