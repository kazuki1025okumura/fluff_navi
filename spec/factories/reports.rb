FactoryBot.define do
  factory :report do
    content_id { 1 }
    body { 'example_example' }
    image { 'example.jpg' }
    association :user
    association :facility
  end
end
