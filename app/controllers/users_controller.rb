class UsersController < ApplicationController

  def show
    @nick_name = current_user.nick_name
  end
  
  def logout
  end

  def allProd
    @products = Product.where(user_id: current_user.id)
  end
  
end
