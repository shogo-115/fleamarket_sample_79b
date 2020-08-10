class BoughtController < ApplicationController

  def index
    @products = Product.where(buyerId: current_user.id)
    @products = Product.includes(:images).where(buyerId: current_user.id)
    @products = Product.all.page(params[:page]).per(18).where(buyerId: current_user.id).order('created_at DESC')
  end
end
