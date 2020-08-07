class NewlooksController < ApplicationController

  def index
    @products = Product.order('created_at DESC')
    @products = Product.includes(:images).order('created_at DESC')
    @products = Product.all.page(params[:page]).per(6).order('created_at DESC')
  end

end
