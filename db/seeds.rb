products = [
  ["mens", "classic", "/images/classic_black.jpg", "black"],
  ["mens", "classic", "/images/classic_gold.jpg", "gold"],
  ["mens", "classic", "/images/classic_white.jpg", "white"],
  ["mens", "high top", "/images/hightop_black.jpg", "black"],
  ["mens", "high top", "/images/hightop_gold.jpg", "gold"],
  ["mens", "high top", "/images/hightop_white.jpg", "white"],
  ["mens", "old school", "/images/oldschool_black.jpg", "black"],
  ["mens", "old school", "/images/oldschool_gold.jpg", "gold"],
  ["mens", "old school", "/images/oldschool_white.jpg", "white"],
  ["womens", "classic", "/images/classic_black.jpg", "black"],
  ["womens", "classic", "/images/classic_gold.jpg", "gold"],
  ["womens", "classic", "/images/classic_white.jpg", "white"],
  ["womens", "high top", "/images/hightop_black.jpg", "black"],
  ["womens", "high top", "/images/hightop_gold.jpg", "gold"],
  ["womens", "high top", "/images/hightop_white.jpg", "white"],
  ["womens", "old school", "/images/oldschool_black.jpg", "black"],
  ["womens", "old school", "/images/oldschool_gold.jpg", "gold"],
  ["womens", "old school", "/images/oldschool_white.jpg", "white"],
]

products.each do |category, style, image, colour|
  3.times do
    product = Product.create(
      category: category,
      style: style,
      image: image,
      colour: colour,
      name: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 4),
      price: Faker::Commerce.price(range: 60..129),
    )

    3.times do |n|
      Unit.create(
        serial_number: SecureRandom.uuid,
        size: 6 + n,
        quantity: rand(0..3),
        product: product,
      )
    end
  end
end
