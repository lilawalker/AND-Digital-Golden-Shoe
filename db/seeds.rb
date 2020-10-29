products = [
  ["mens", "classic"],
  ["mens", "high top"],
  ["mens", "old school"],
  ["womens", "classic"],
  ["womens", "high top"],
  ["womens", "old school"],
]

units = []

3.times do |x|
  units << ["images/image.jpg", "white", 6 + x]
  units << ["images/image.jpg", "black", 6 + x]
  units << ["images/image.jpg", "gold", 6 + x]
end

products.each do |category, style|
  3.times do |x|
    product = Product.create(
      category: category,
      style: style,
      name: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 4)
    )

    units.each do |image, colour, size|
      Unit.create(
        image: image,
        colour: colour,
        price: Faker::Commerce.price(range: 60..129),
        size: size,
        quantity: rand(0..3),
        product: product,
      )
    end
  end
end

