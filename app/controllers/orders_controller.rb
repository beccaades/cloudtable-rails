class OrdersController < InheritedResources::Base

  respond_to :json

  def add_item
    @order.order_items.create(params[:order_item])
  end

  def remove_item
    @order.order_items.delete_at(params[:order_item][:id])
  end

end
