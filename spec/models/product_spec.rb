require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品保存' do

  context '商品出品できるとき' do

    it "全ての項目の入力が正しく存在すれば出品できること" do
      expect(@product).to be_valid
     end
  end

  context '商品出品できないとき' do

   it "商品画像を1枚つけることが必須であること" do
    @product.image = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Image can't be blank")
    end

   it "商品名が必須であること" do
    @product.product_name = ""
    @product.valid?
    expect(@product.errors.full_messages).to include("Product name can't be blank")
   end

   it "商品の説明が必須であること" do
    @product.description = ""
    @product.valid?
    expect(@product.errors.full_messages).to include("Description can't be blank")
   end

   it "カテゴリーの情報が必須であること" do
    @product.category_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Category must be other than 1")
   end

   it "商品の状態についての情報が必須であること" do
    @product.status_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Status must be other than 1")
   end

   it "配送料の負担についての情報が必須であること" do
    @product.shipping_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Shipping must be other than 1")
   end

   it "発送元の地域についての情報が必須であること" do
    @product.prefecture_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
   end

   it "発送までの日数についての情報が必須であること" do
    @product.send_day_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Send day must be other than 1")
   end

   it "販売価格についての情報が必須であること" do
    @product.price = ""
    @product.valid?
    expect(@product.errors.full_messages).to include("Price can't be blank")
   end

   it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
    @product.price = 299
    @product.valid?
    expect(@product.errors.full_messages).to include("Price must be greater than 299")
   end

    it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
      @product.price = 100000000
      @product.valid?
      expect(@product.errors.full_messages).to include( "Price must be less than 1000000")
   end

   it "販売価格は半角数字のみ保存可能であること" do
    @product.price = "３００"
    @product.valid?
    expect(@product.errors.full_messages).to include("Price is not a number")
   end

   it "販売価格は半角数字のみ保存可能であること" do
    @product.price = "aaaa"
    @product.valid?
    expect(@product.errors.full_messages).to include("Price is not a number")
   end

   it '紐づくユーザーが存在しないと保存できないこと' do
    @product.user = nil
    @product.valid?
    expect(@product.errors.full_messages).to include('User must exist')
   end
  end
 end
end