require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品購入ができるとき' do
      it '@purchase_shipping_addressに問題がないとき' do
        expect(@purchase_shipping_address).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'user_idが空では登録できない' do
        @purchase_shipping_address.user_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @purchase_shipping_address.item_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @purchase_shipping_address.postal_code = 1_234_567
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では登録できない' do
        @purchase_shipping_address.prefecture_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では登録できない' do
        @purchase_shipping_address.prefecture_id = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空では登録できない' do
        @purchase_shipping_address.municipalities = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空では登録できない' do
        @purchase_shipping_address.address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では登録できない' do
        @purchase_shipping_address.phone_num = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが数字でないと登録できない' do
        @purchase_shipping_address.phone_num = 'アイウエオ'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone num Half-width number')
      end

      it 'phone_numが11桁以内でないと登録できない' do
        @purchase_shipping_address.phone_num = '090000000000'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone num maximum 11 characters')
      end

      it 'tokenがなければ登録できない' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
