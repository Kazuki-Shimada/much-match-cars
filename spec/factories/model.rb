FactoryBot.define do
  factory :model do
    name { Faker::Lorem.characters(number: 10) }
    price { "1000000 ~ 2000000" }
    association :manufacturer
  end
end