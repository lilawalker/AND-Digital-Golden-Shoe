FactoryBot.define do
  factory :product do
    category { "Womens" }
    style { "Classic" }
    name { "Classic trainers" }
    description { "Classic trainers with style" }
    image { "image.jpeg" }
    colour { "Black" }
    price { 79.00 }
  end
end
