class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    if current_user.id == user.id
      @nick_name = user.nick_name
      @products = Product.where(user_id: params[:id])
      @products = Product.includes(:images).where(user_id: params[:id])
      @products = Product.all.page(params[:page]).per(18).where(user_id: params[:id]).order('created_at DESC')
      @productsB = Product.where(buyerId: params[:id])
      @productsB = Product.includes(:images).where(buyerId: params[:id])
      @productsB = Product.all.page(params[:page]).per(18).where(buyerId: params[:id]).order('created_at DESC')
    else
      redirect_to root_path
    end
  end
  
  def logout
  end
  
end
