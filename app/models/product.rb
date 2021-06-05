class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :send_day

  belongs_to :user 
  has_many :purchase_user
  has_one_attached :image

  with_options presence: true do
  validates :product_name
  validates :description
  validates :image

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_id
  validates :prefecture_id
  validates :send_day_id
  end

  validates :price, format: { with: /\A[0-9]+\z/i, message: 'に半角数字を使用してください' },
  numericality: {greater_than: 299,less_than: 1000000}
 end
end  