class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :apartment, :phone_number, :item_id, :user_id

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
end