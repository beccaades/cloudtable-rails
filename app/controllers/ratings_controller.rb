class RatingsController < InheritedResources::Base

  respond_to :json

  def from_menu_item
    @rating = Rating.for(params[:menu_item_id])
  end
end
