class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :purchase_id, :postal_code, :municipalities, :address, :building_name, :phone_num

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :phone_num, format: {with: /\A[0-9]+\z/, message: 'Half-width number'}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_num: phone_num)
  end


end