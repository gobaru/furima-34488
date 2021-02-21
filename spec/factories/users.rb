FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000000q' }
    password_confirmation { password }
    birthday              { '2021-11-11' }
    first_name            { '佐藤' }
    last_name             { '太郎' }
    first_name_kana       { 'サトウ' }
    last_name_kana        { 'タロウ' }
  end
end
