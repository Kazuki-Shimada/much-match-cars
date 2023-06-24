FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.characters(number: 30) }
    association :user
    association :review
  end
end