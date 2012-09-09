class Subsection

  attr_accessor :name, :subsection_items

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end
