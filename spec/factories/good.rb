FactoryBot.define do
  factory :good do
    association :user
    association :review
  end
end