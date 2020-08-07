class MensController < ApplicationController

  def index
    @products = Product.where(category_id: 2)
    @products = Product.includes(:images).where(category_id: 2)
    @products = Product.all.page(params[:page]).per(6).where(category_id: 2).order('created_at DESC')
  end

end
