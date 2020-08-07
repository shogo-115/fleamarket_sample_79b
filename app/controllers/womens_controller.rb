class WomensController < ApplicationController

  def index
    @products = Product.where(category_id: 1)
    @products = Product.includes(:images).where(category_id: 1)
    @products = Product.all.page(params[:page]).per(6).where(category_id: 1).order('created_at DESC')
  end

end
