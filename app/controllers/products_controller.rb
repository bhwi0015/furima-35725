class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.price >= 300 && @product.price <= 9999999
      redirect_to new_product_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :status_id, :shipping_id, :prefecture_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
