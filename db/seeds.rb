products = [
  ["mens", "classic", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "classic", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "classic", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "high top", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "high top", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "high top", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "old school", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "old school", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["mens", "old school", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "classic", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "classic", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "classic", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "high top", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "high top", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "high top", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "old school", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "old school", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
  ["womens", "old school", Faker::Lorem.sentence(word_count: 3), Faker::Lorem.paragraph(sentence_count: 4)],
]

products.each do |category, style, name, description|
  colours = ["black", "white", "gold"]

  colours.each do |colour|
    image = "/images/#{style.underscore}_#{colour}.jpg"
    product = Product.create(
      category: category,
      style: style,
      image: image,
      colour: colour,
      name: name,
      description: description,
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
