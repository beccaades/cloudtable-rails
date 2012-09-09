class Restaurant < ActiveRecord::Base

  has_many :tables
  has_many :orders

  attr_accessible :venue_id
  attr_accessor :api_response, :api_menus, :name, :address

  def load
    self.api_response ||= JSON.parse(Locu.find_venue(venue_id))
    
    self.name = api_response["objects"].first["name"]
    self.address = api_response["objects"].first["street_address"]
    self.api_menus = api_response["objects"].first["menus"]
  end

  def menus
    self.load if self.api_response.blank?
    menu_objects = []

    if self.api_menus.present?
      self.api_menus.each do |menu|
        menu_object = Menu.new(:name => menu["menu_name"])

        if menu["sections"].present?
          menu_object.subsections = []

          menu["sections"].each do |section|
            subsection_name = section["section_name"]
            subsection_object = Subsection.new

            if section["subsections"].present?
              section["subsections"].each do |subsection|
                subsection_name += " - #{section["subsection_name"]}" if section["subsection_name"].present?
                subsection_object.items = []

                if subsection["contents"].present?
                  subsection["contents"].each do |item|
                    subsection_item_obj = SubsectionItem.new(:description => item["description"],
                                                             :name => item["name"],
                                                             :price => item["price"])
                    subsection_item_obj.load_menu_item_id(self.address)
                    subsection_object.items << subsection_item_obj
                  end
                end
              end
            end

            subsection_object.name = subsection_name
            menu_object.subsections << subsection_object
          end
        end
        
        menu_objects << menu_object
      end
    end

    menu_objects
  end
end
