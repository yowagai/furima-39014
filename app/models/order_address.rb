class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :apartment, :phone_number, :item_id, :user_id, :token

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, apartment: apartment, phone_number: phone_number, order_id: order.id)
  end
end