FactoryBot.define do
  factory :product do
    sequence(:category) { |n| "Womens#{n}" }
    sequence(:style) { |n| "Boots#{n}" }
    sequence(:name) { |n| "High fashion boots#{n}" }
    sequence(:description) { |n| "Leather boots with laces#{n}" }
  end
end
