class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :purchase_users
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
      validates :nickname
      validates :birthday
   
  with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: 'に全角文字を使用してください' } do
     validates :last_name_kanji
     validates :first_name_kanji
    end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください' } do
     validates :last_name_kana
     validates :first_name_kana
    end
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
     validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
