class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_day

  # validates :category, :delivery_fee, :item_condition, :prefecture, :shipping_day, presence: true
  validates :category_id, :delivery_fee_id, :item_condition_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 } 

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category
    validates :delivery_fee
    validates :item_condition
    validates :prefecture
    validates :shipping_day
    validates :price
  end

  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: 'Price Half-width number' } do
    validates :price
  end

  validates :price,
  numericality: {greater_than: 300, less_than: 9,999,999}

end
