class PurchaseUserAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :flat_number, :apartment, :phone_number, :purchase_user_id, :product_id, :user_id


  with_options presence: true do
    validates :city
    validates :flat_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :product_id

   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
   validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

   def save

     purchase_user = PurchaseUser.create(product_id: product_id, user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, flat_number: flat_number, phone_number: phone_number, purchase_user_id: purchase_user.id)
  end

end