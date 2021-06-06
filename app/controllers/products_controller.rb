class ProductsController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create,:edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  def index
    @products = Product.all.order("created_at DESC")
  end

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

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end 

  private
  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :status_id, :shipping_id, :prefecture_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @product = Product.find(params[:id])
  end

  def contributor_confirmation
    unless current_user == @product.user
           redirect_to root_path
    end
  end
end