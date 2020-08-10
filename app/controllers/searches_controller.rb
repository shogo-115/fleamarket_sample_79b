class SearchesController < ApplicationController
  before_action :set_ransack
  
  def index
    @products = @q.result(distinct: true)
    if params[:q].present?
      @keyword = params[:q][:name_cont]
    else
      params[:q] = {sorts: 'id asc'}
    end
  end

  private
  def set_ransack
    @q = Product.ransack(params[:q])
  end
end