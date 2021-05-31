class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  #def index
    #@products = Product.all.order("created_at DESC")
  #end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :status_id, :shipping_id, :prefecture_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
