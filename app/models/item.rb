class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :estimated

  belongs_to :user
  # has_one :order
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }
  validates :estimated_id, presence: true, numericality: { other_than: 1 }

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
