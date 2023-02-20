class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :estimated_id, presence: true

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
