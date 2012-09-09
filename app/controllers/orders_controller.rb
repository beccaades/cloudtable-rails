class OrdersController < InheritedResources::Base

  respond_to :json

  def add_item
    @order.add_item(params[:menu_item_id])
  end

  def remove_item
    @order.remove_item(params[:menu_item_id])
  end

  def index
    @orders = User.exists?(:uid => params[:uid]) ? User.find_by_uid(params[:uid]).orders : []
    index!
  end
end
