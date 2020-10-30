FactoryBot.define do
  factory :product do
    category { "womens" }
    style { "classic" }
    name { "Womens classic trainers" }
    description { "Classic trainers with style" }
    image { "/images/classic_black.jpeg" }
    colour { "black" }
    price { 79.00 }
  end
end
