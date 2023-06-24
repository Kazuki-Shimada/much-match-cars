FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
    password_confirmation { password }
  end
end