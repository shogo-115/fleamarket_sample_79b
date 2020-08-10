class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nick_name = user.nick_name
    @products = Product.where(user_id: params[:id]).last
    @proImgs = @products.images.first
  end
  
  def logout
  end
  
end
