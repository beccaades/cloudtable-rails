class RestaurantsController < InheritedResources::Base

  respond_to :json

  def show
    resource.load
  end
end
