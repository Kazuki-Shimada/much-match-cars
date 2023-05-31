# FactoryBot.define do
#   factory :book do
#     sequence(:title) { |n| "title#{n}"}
#     sequence(:body) { |n| "body#{n}"}
#   end
# end

FactoryBot.define docqwds
  factory :review do
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:30) }
  end
end