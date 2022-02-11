require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @order = FactoryBot.build(:order, item_id: item.id, user_id: user.id)
      sleep(1)
    end

    context '購入できる時' do
      it '購入できる' do
        expect(@order).to be_valid
      end
    end


    context '購入できないとき' do

      it '郵便番号が必須であること' do
        @order.post_code = ''
        @order.valid?
        binding.pry
      end
      
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      end

      it '都道府県が必須であること' do
      end

      it '市区町村が必須であること' do
      end

      it '番地が必須であること' do
      end

      it '建物名は任意であること' do
      end

      it '電話番号が必須であること' do
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      end

    end
  end
end
