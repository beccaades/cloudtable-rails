class OrdersController < InheritedResources::Base

  respond_to :json

  def add_item
    @order.add_item(params[:order_item])
  end

  def remove_item
    @order.remove_item(params[:order_item][:id])
  end

  def index
    @orders = User.exists?(:uid => params[:uid]) ? User.find_by_uid(params[:uid]).orders : []
    index!
  end
end
