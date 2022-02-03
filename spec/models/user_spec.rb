require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが必須であること。' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること。' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end


      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        binding.pry
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    
    
    it 'メールアドレスは、@を含む必要があること' do
      user = FactoryBot.build(:user)
      user.email = 'testexample'
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが必須であること' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")

    end
    
    it 'パスワードは、6文字以上での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.password = 'aaa11'
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.password = '111111'
      user.valid?
      expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aaa111', password_confirmation: 'bbb222', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '1999-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")

      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.last_name = 'yamada'
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")

      user = FactoryBot.build(:user)
      user.first_name = 'tarou'
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")

      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      user = FactoryBot.build(:user)
      user.last_name_kana = 'やまだ'
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")

      user = FactoryBot.build(:user)
      user.first_name_kana = 'たろう'
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end

    it '生年月日が必須であること' do
      user = FactoryBot.build(:user)
      user.birth_day = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
