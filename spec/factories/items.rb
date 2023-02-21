FactoryBot.define do
  factory :item do
    name          {Faker::Lorem.words}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    explanation   {Faker::Lorem.sentence}
    category_id   {Faker::Number.between(from: 2, to: 11)}
    condition_id  {Faker::Number.between(from: 2, to: 7)}
    charge_id     {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    estimated_id  {Faker::Number.between(from: 2, to: 4)}
  end
end
