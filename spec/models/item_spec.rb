require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる時' do
      it '商品画像、商品名、説明、カテゴリー、状態、配送料負担情報、発送元地域、発送までの日数、価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が必須であること' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担の情報が必須であること' do
        @item.shipment_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end

      it '発送元の地域の情報が必須であること' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it '発送までの日数の情報が必須であること' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it '価格が300円未満では出品できないこと' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it '価格が9_999_999円を超えると出品できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      it 'ユーザーが紐づいていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
