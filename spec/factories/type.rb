FactoryBot.define do
  factory :type do
    name { Faker::Name.name }
    price {Faker::Number.between(to: 9999999)}
    capacity {Faker::Number.between(to: 8)}
    displacement {Faker::Number.between(to: 3)}
    fuel_consumption {Faker::Number.between(to: 99)}
    fuel { Faker::Lorem.characters(number: 10) }
    association :model
  end
end