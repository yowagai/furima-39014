class Address < ApplicationRecord
  belongs_to :order

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
