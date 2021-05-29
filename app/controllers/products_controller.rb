class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
    unless user_signed_in?
      redirect_to user_session_path
    end
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
