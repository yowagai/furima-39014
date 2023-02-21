class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :estimated

  belongs_to :user
  # has_one :order
  has_one_attached :image

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { onyl_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :charge_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }
  validates :estimated_id, presence: true, numericality: { other_than: 1 }

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
