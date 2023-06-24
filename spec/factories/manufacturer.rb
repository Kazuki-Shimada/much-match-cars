FactoryBot.define do
  factory :manufacturer do
    name { Faker::Name.name }
  end
end