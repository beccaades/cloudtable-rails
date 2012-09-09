class TablesController < InheritedResources::Base

  respond_to :json

  def from_token
    @table = Table.find_by_token(params[:token]) if params[:token].present?
    @table.orders.create
  end

end
