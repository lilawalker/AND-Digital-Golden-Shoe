products = [
  ["mens", "classic"],
  ["mens", "high top"],
  ["mens", "old school"],
  ["womens", "classic"],
  ["womens", "high top"],
  ["womens", "old school"],
]

units = {
  "classic" => [
    ["/images/classic_black.jpg", "black"],
    ["/images/classic_gold.jpg", "gold"],
    ["/images/classic_white.jpg", "white"],
  ],
  "high top" => [
    ["/images/hightop_black.jpg", "black"],
    ["/images/hightop_gold.jpg", "gold"],
    ["/images/hightop_white.jpg", "white"],
  ],
  "old school" => [
    ["/images/oldschool_black.jpg", "black"],
    ["/images/oldschool_gold.jpg", "gold"],
    ["/images/oldschool_white.jpg", "white"],
  ]
}

products.each do |category, style|
  variations = units[style]

  3.times do
    product = Product.create(
      category: category,
      style: style,
      name: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 4)
    )

    variations.each do |image, colour|
      3.times do |n|
        Unit.create(
          image: image,
          colour: colour,
          price: Faker::Commerce.price(range: 60..129),
          size: 6 + n,
          quantity: rand(0..3),
          product: product,
          serial_number: SecureRandom.uuid,
        )
      end
    end
  end
end
