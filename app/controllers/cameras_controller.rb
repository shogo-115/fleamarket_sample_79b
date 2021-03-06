class CamerasController < ApplicationController

  def index
    @products = Product.where(category_id: 8)
    @products = Product.includes(:images).where(category_id: 8)
    @products = Product.all.page(params[:page]).per(18).where(category_id: 8).order('created_at DESC')
  end

end
