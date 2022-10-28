FactoryBot.define do
  factory :post do
    title { 'example' }
    association :user
    association :facility
  end
end
