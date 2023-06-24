FactoryBot.define do
  factory :model do
    name { Faker::Name.name }
    price { "1000000 ~ 2000000" }
    association :manufacturer
  end
end