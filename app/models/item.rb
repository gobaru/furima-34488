class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :delivery_fee_id
    validates :item_condition_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :category_id, :delivery_fee_id, :item_condition_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: 'Half-width number' } do
    validates :price
  end

  validates :price,
            numericality: { greater_than: 299, less_than: 10_000_000 }
end
