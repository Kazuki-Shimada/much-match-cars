FactoryBot.define do
  factory :manufacturer do
    name { Faker::Lorem.characters(number: 3) }
  end
end