class Product < ApplicationRecord

  belongs_to :user 
  has_one_attached :image

  with_options presence: true do
  validates :product_name
  validates :description
  validates :category_id
  validates :status_id
  validates :shipping_id
  validates :prefecture_id
  validates :send_day_id
  validates :price
  validates :image
  
  with_options, format: { with: /^[0-9]+$/, message: 'に半角数字を使用してください' } do
  validates :price
  end
 end
end  