class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_ransack
  
  def index
    @product = Product.all
    @products = Product.order('created_at DESC').limit(10)
    @products = Product.includes(:images).order('created_at DESC').limit(10)
  end

  def new
    @product = Product.new
    @product.images.new
    @parents = Category.all.order("id ASC").limit(13)
  end

  def children
    @children = Category.find(params[:id]).children
  end

  def grandchildren
    @grandchildren = Category.find(params[:id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.new
      render :new
    end
  end

  def edit
  end

  def update
    if @product.user_id == current_user.id && @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to proDlt_path
  end

  def show
    @producter = @product.user
    @categorie = @product.category
    @proImgs = @product.images
    @proImge = @proImgs.first
    @comment = Comment.new
    @comments = @product.comments
  end

  def proDlt
  end

  private

  def product_params
    params.require(:product).permit(:name, :discribe, :status, :category_id, :brand, :shipping_cost, :shipping_from, :days, :price, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_user
    @product = current_user.products.find_by(id: params[:id])
      unless @product
        redirect_to products_path
      end
  end
end
