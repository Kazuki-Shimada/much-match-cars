FactoryBot.define do
  factory :review do
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 30) }
    rate {Faker::Number.between(to: 5)}
    design {Faker::Number.between(to: 5)}
    driving_performance {Faker::Number.between(to: 5)}
    cost {Faker::Number.between(to: 5)}
    size {Faker::Number.between(to: 5)}
    safety {Faker::Number.between(to: 5)}
    association :user
    association :type
  end
end
