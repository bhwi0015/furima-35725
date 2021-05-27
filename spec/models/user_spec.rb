require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

   context '新規登録できるとき' do
    it "全ての項目の入力が存在すれば登録できること" do
     @user = FactoryBot.build(:user)
     expect(@user).to be_valid
    end

    it '6文字が入力されていれば、登録が可能なこと' do
       @user.password = 'aaaaa1'
       @user.password_confirmation = 'aaaaa1'
       expect(@user).to be_valid
    end

    it '半角英数字が混合されていれば、登録が可能なこと' do
      @user.password = '1aaaaa'
      @user.password_confirmation = '1aaaaa'
      expect(@user).to be_valid
    end
    
   end

    context '新規登録できないとき' do

    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

     it "重複したemailが存在する場合登録できないこと" do
      @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

     it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

     it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であるこ' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'パスワードは、半角英数字混合での入力が必須であるこ' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password_confirmation = 'aaaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザーの名字が必須であること' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it 'ユーザーの名前が必須であること' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it 'ユーザーの名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name_kanji = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji に全角文字を使用してください")
    end

    it 'ユーザーの名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name_kanji = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji に全角文字を使用してください")
    end

    it 'ユーザーの名字フリガナが必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include( "Last name kana can't be blank")
    end

    it 'ユーザーの名前フリガナが必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'ユーザーの名字フリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana に全角カタカナを使用してください")
    end

    it 'ユーザーの名前フリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana に全角カタカナを使用してください")
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
  end
end
end