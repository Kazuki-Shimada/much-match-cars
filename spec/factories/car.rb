FactoryBot.define do
  factory :car do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    model_year {Faker::Lorem.characters(to: 2023)}
    association :user
    association :type
  end
end