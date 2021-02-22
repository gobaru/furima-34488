class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :category, :delivery_fee, :item_condition, :prefecture, :shipping_day, presence: true

  validates :category_id, :delivery_fee_id, :item_condition_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 } 


end
