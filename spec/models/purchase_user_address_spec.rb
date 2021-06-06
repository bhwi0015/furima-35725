require 'rails_helper'

RSpec.describe PurchaseUserAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/star.png')
    @product.save
    @purchase_user_address = FactoryBot.build(:purchase_user_address, user_id: user.id, product_id: @product.id)
    sleep 0.1
  end

  describe '商品保存' do

    context '内容に問題ない場合' do

     it "登録内容に問題がない場合" do
       expect(@purchase_user_address).to be_valid
     end

     it "建物名があってもテストができる" do
      expect(@purchase_user_address).to be_valid
     end

     it "建物名がなくてもテストができる" do
      @purchase_user_address.apartment = ""
      expect(@purchase_user_address).to be_valid
     end


    end

    context '内容に問題がある場合' do

      it "tokenが作られなかったとき" do
       @purchase_user_address.token = nil
       @purchase_user_address.valid?
       expect(@purchase_user_address.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空の時" do
        @purchase_user_address.postal_code = ""
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Postal code can't be blank")
       end

       it "都道府県の選択がされてないとき" do
        @purchase_user_address.prefecture_id = 1
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Prefecture Slect prefecture")
       end

      it "市区町村が空のとき" do
        @purchase_user_address.city = ""
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("City can't be blank")
       end

      it "番地が空のとき" do
        @purchase_user_address.flat_number = ""
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Flat number can't be blank")
       end

      it "電話番号が空のとき" do
        @purchase_user_address.phone_number = ""
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number can't be blank")
       end

      it "郵便番号に(-)が含まれていないとき" do
        @purchase_user_address.postal_code = "1234567"
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
       end

       it "phone_numberが英数混合では登録できないこと" do
        @purchase_user_address.phone_number = "1234567aaa"
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number 半角数字のみを使用してください")
       end

       it "12桁以上では登録できないこと" do
        @purchase_user_address.phone_number = "1234567890123"
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number 有効な電話番号を使用してください")
       end

       it "9桁以下では登録できないこと" do
        @purchase_user_address.phone_number = "1234567"
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number 有効な電話番号を使用してください")
       end

      it "紐ずくuserがいないとき" do
        @purchase_user_address.user_id = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("User can't be blank")
       end

       it "紐ずくproductがないとき" do
        @purchase_user_address.product_id = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Product can't be blank")
       end
    end
 end
end
