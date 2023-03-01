require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, :item_id => item.id, :user_id => user.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'post_code,prefectur_id,city,address,phone_number,user_id,item_id,tokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'apartmentが存在しなくても登録できる' do
        @order_address.apartment = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prifectur_idが空では登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture を選択して下さい')
      end
      it 'cityが空では登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeに「-」がないとでは登録できない' do
        @order_address.post_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_numberが10桁以下では登録できない' do
        @order_address.phone_number = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが11桁以上では登録できない' do
        @order_address.phone_number = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'phone_numberに半角数字以外が含まれている場合は登録できない' do
        @order_address.phone_number = "123あ456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
