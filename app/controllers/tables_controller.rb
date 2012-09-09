class TablesController < InheritedResources::Base

  respond_to :json

  def from_token
    resource = Table.find_by_token(params[:token])
  end
end
