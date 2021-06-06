class PurchaseUsersController < ApplicationController

   before_action :set_product 
   before_action :contributor_confirmation, only: [:index, :create]
   before_action :authenticate_user!, only: [:index, :create]
  def index
    @purchase_user_address = PurchaseUserAddress.new
  end

  def create
    @purchase_user_address = PurchaseUserAddress.new(purchase_user_address_params)
   if @purchase_user_address.valid?
      pay_product
      @purchase_user_address.save
       redirect_to root_path
   else
      render :index
    end
  end

  private

  def purchase_user_address_params
       params.require(:purchase_user_address).permit(:postal_code, :prefecture_id, :city, :flat_number, :apartment,:phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
  
  def set_product 
    @product = Product.find(params[:product_id])
  end
  
  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
     amount: @product.price,
     card: purchase_user_address_params[:token], 
     currency: 'jpy' 
    )
  end

  def contributor_confirmation
     if current_user == @product.user && @product.purchase_user.present? 
        redirect_to root_path
  end
 end
end
