class BuysController < ApplicationController
  def show
    @address = Address.find_by(user_id: current_user.id)
    @product = Product.find_by(id: params[:id])
    @categorie = @product.category
    @proImgs = @product.images
  end
end
