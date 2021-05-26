class Product < ApplicationRecord


  belongs_to :user 
  has_one_attached :image
  
  validates :product_name,  presence: true
  validates :description,   presence: true
  validates :category_id,   presence: true
  validates :status_id,     presence: true
  validates :shipping_id,   presence: true
  validates :prefecture_id, presence: true
  validates :send_day_id,   presence: true
  validates :price,         presence: true
  validates :image,         presence: true

end  