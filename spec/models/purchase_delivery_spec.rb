require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    user               = FactoryBot.create(:user)
    listing            = FactoryBot.create(:listing)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, listing_id: listing.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '商品を購入できる' do
      it 'token, postal_code, prefectures, municipality, address, phone_numberが存在すれば購入できる' do
        expect(@purchase_delivery).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '商品を購入できない' do
      it 'tokenが空では購入できない' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_delivery.postal_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecturesを選択しなければ購入できない' do
        @purchase_delivery.prefectures_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @purchase_delivery.municipality = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと購入できない' do
        @purchase_delivery.phone_number = '１９０１２３４５６７８'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @purchase_delivery.phone_number = '111111111111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが英数混合では購入できない' do
        @purchase_delivery.phone_number = '1a1a1a1a1a1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'listingが紐付いていないと購入できない' do
        @purchase_delivery.listing_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Listing can't be blank")
      end
    end
  end
end
