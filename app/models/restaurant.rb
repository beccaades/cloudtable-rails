class Restaurant < ActiveRecord::Base

  has_many :tables

  attr_accessible :venue_id
  attr_accessor :api_response, :api_menus, :name

  def load
    self.api_response ||= JSON.parse(Locu.find_venue(venue_id))
    
    self.name = api_response["objects"].first["name"]
    self.api_menus = api_response["objects"].first["menus"]
  end

  def menus
    self.load if self.api_response.blank?
    menu_objects = []

    if self.api_menus.present?
      self.api_menus.each do |menu|
        menu_object = Menu.new(:name => menu["menu_name"])

        if menu["sections"].present?
          menu_object.sections = []

          menu["sections"].each do |section|
            section_object = Section.new(:name => section["section_name"])
            section_object.subsections = []

            if section["subsections"].present?
              section["subsections"].each do |subsection|
                subsection_object = Subsection.new(:name => section["subsection_name"])
                subsection_object.subsection_items = []

                if subsection["contents"].present?
                  subsection["contents"].each do |item|
                    subsection_item_obj = SubsectionItem.new(:description => item["description"],
                                                             :name => item["name"],
                                                             :price => item["price"])
                    subsection_object.subsection_items << subsection_item_obj
                  end
                end

                section_object.subsections << subsection_object
              end
            end

            menu_object.sections << section_object
          end
        end
        
        menu_objects << menu_object
      end
    end

    menu_objects
  end
end
