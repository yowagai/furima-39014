# require 'rails_helper'

# RSpec.describe Address, type: :model do
#   before do
#     @address = FactoryBot.build(:address)
#   end

#   describe '配送先登録' do
#     context '配送先登録ができる場合' do
#       it 'post_code,prefectur_id,city,address,phone_numberが存在すれば登録できる' do
#         expect(@address).to be_valid
#       end
#       it 'apartmentが存在しなくても登録できる' do
#         @address.apartment = ''
#         expect(@address).to be_valid
#       end
#     end
#     context '配送先登録ができない場合' do
#       it 'post_codeが空では登録できない' do
#         @address.post_code = nil
#         @address.valid?
#         binding.pry
#         expect(@address.errors.full_messages).to include("Address can't be blank")
#       end
#     end
#   end
# end
