require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @order = FactoryBot.build(:order, item_id: item.id, user_id: user.id)
      sleep(0.1)
    end

    context '購入できる時' do
      it '郵便番号、都道府県、市町村、番地、電話番号が入力されれば購入できること' do
        expect(@order).to be_valid
      end

      it '建物名は任意であること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end


    context '購入できないとき' do

      it '郵便番号が必須であること' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.post_code = '1111-111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が必須であること' do
        @order.prefecture = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号は、10桁以上で保存可能なこと' do
        @order.telephone_number = '111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end

      it '電話番号は11桁以内で保存可能なこと' do
        @order.telephone_number = '1111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end

      it '電話番号は半角数値のみ保存可能なこと' do
        @order.telephone_number = 'aaaaaaaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid. Input half-width characters.")
      end

    end
  end
end
