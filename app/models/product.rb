class Product < ApplicationRecord

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' } do
     validates :last_name_kanji
     validates :first_nanme_kanji
    end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください' } do
     validates :last_name_kana
     validates :first_name_kana
    end

    def password_complexity
     return if password.blank? || password =~ /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i
   errors.add :password, "パスワードの強度が不足しています。半角英数字混合で入力する必要があります。"
  end 
end
