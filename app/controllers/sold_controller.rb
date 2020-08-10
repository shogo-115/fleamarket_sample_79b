class SoldController < ApplicationController

  def index
    @products = Product.where(user_id: current_user.id)
    @products = Product.includes(:images).where(user_id: current_user.id)
    @products = Product.all.page(params[:page]).per(18).where(user_id: current_user.id).order('created_at DESC')
  end
end
