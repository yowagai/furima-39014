require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '新規商品出品できる場合' do
      it "name、price、explanation、categry_id、condition_id、charge_id、prefecture_id、estimated_id、user_id、imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '新規商品出品できない場合' do
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
