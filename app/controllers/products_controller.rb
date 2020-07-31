class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.includes(:images).order('created_at DESC').limit(4)
  end

  def new
    @product = Product.new
    @product.images.new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :discribe, :status, :category_id, :brand, :shipping_cost, :shipping_from, :days, :price, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
