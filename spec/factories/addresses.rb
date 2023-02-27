FactoryBot.define do
  factory :address do
    post_code     { "111-1111" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.city }
    address       { Faker::Address.street_address }
    apartment     { Faker::Address.community }
    phone_number  { Faker::Number.between(from: 1000000000, to: 99999999999) }

    association :order
  end
end
