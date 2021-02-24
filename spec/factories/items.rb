FactoryBot.define do
  factory :item do
    name              { 'テスト' }
    introduction      { 'テストの説明' }
    category_id       { 2 }
    delivery_fee_id   { 2 }
    item_condition_id { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    price             { 1200 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
