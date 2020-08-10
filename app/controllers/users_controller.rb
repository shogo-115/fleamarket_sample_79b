class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    if current_user.id  == user.id
      @nick_name = user.nick_name
      @products = Product.where(user_id: params[:id]).last
      @proImgs = @products.images.first
    else
      redirect_to root_path
    end
  end
  
  def logout
  end
  
end
