require 'rails_helper'
RSpec.describe Listing, type: :model do
  before do
    @listing = FactoryBot.build(:listing)
  end

  describe '商品情報登録' do
    context '商品を登録できる' do
      it 'product_name, description, category, status, shipping_burden,
         prefectures, shipping_days, priceが存在すれば登録できる' do
        expect(@listing).to be_valid
      end
    end

    context '商品を登録できない' do
      it 'imageが空では登録できない' do
        @listing.image = nil
        @listing.valid?
        expect(@listing.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では登録できない' do
        @listing.product_name = ''
        @listing.valid?
        expect(@listing.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @listing.description = ''
        @listing.valid?
        expect(@listing.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryを選択しなければ登録できない' do
        @listing.category_id = 1
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Category must be other than 1')
      end
      it 'statusを選択しなければ登録できない' do
        @listing.status_id = 1
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shipping_burdenを選択しなければ登録できない' do
        @listing.shipping_burden_id = 1
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Shipping burden must be other than 1')
      end
      it 'prefecturesを選択しなければ登録できない' do
        @listing.prefectures_id = 1
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'shipping_daysを選択しなければ登録できない' do
        @listing.shipping_days_id = 1
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Shipping days must be other than 1')
      end
      it 'priceが空では登録できない' do
        @listing.price = ''
        @listing.valid?
        expect(@listing.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の範囲でないと登録できない(¥300以下)' do
        @listing.price = 299
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥300~¥9,999,999の範囲でないと登録できない(¥9,999,999以上)' do
        @listing.price = 10000000
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字でないと登録できない(全角数字)' do
        @listing.price = '２０００'
        @listing.valid?
        expect(@listing.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
