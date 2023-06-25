FactoryBot.define do
  factory :car do
    model_year { "2023" }
    association :user
    association :type
  end
end