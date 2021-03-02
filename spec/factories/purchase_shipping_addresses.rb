FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code          { '123-4567' }
    prefecture_id        { 3 }
    municipalities       { '横浜市' }
    address              { '1-1' }
    building_name        { '東京ハイツ' }
    phone_num            { '09000000000' }
  end
end
