require 'rails_helper'

RSpec.feature 'Product', type: :feature do

  before do
    products = [
      ["mens", "classic", "Mens classic trainers", "Bouncy cushiony sole", "black", "/images/classic_black.jpeg"],
      ["mens", "classic", "Mens classic trainers", "Bouncy cushiony sole", "white", "/images/classic_white.jpeg"],
      ["mens", "classic", "Mens classic trainers", "Bouncy cushiony sole", "gold", "/images/classic_gold.jpeg"],
    ]

    products.each do |category, style, name, description, colour, image|
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
            quantity: 0 + n,
            product: product,
          )
        end
      end
    end

    scenario "displays the product name and image of corresponding product" do
      visit "/products/#{Product.first.id}"
      expect(page).to have_content "Mens classic trainers"
      expect(page).to have_css 'img[src*="classic_black.jpeg"]'
    end

    scenario "updates the product based on colour selection" do
      visit "/products/#{Product.first.id}"
      click_link "white"
      expect(page.current_path).to eq "/products/#{Product.first.id + 1}"
      expect(page).to have_css 'img[src*="classic_white.jpeg"]'
    end

    scenario "displays 'Out of Stock' if the product and size are not in stock" do
      visit "/products/#{Product.first.id + 2}?size=6"
      expect(page).to have_content "Out of Stock"
    end

    scenario "displays 'In Stock' if the product and size are in stock" do
      visit "/products/#{Product.first.id + 2}?size=8"
      expect(page).to have_content "In stock"
    end

  end



