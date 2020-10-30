require 'rails_helper'

RSpec.feature 'Products', type: :feature do

  before do
    Product.create(
      category: "womens",
      style: "classic",
      name: "Womens classic trainers",
      description: "Classic trainers with style",
      image: "/images/classic_black.jpeg",
      colour: "black",
      price: 79.00,
    )

    Product.create(
      category: "mens",
      style: "high top",
      name: "Mens high top trainers",
      description: "High top trainers with style",
      image: "/images/high top_white.jpeg",
      colour: "white",
      price: 79.00,
    )

    Product.create(
      category: "womens",
      style: "high top",
      name: "Womens high top trainers",
      description: "Super fly trainers with style",
      image: "/images/high top_black.jpeg",
      colour: "black",
      price: 79.00,
    )
  end

  scenario "displays the product name and image" do
    visit "/products"
    expect(page).to have_content "Womens classic trainers"
    expect(page).to have_css 'img[src*="classic_black.jpeg"]'
  end

  scenario "filter by category" do
    visit "/products?category=womens"
    expect(page).to have_content "Womens classic trainers"
    expect(page).to have_content "Womens high top trainers"
    expect(page).not_to have_content "Mens high top trainers"
  end

  scenario "filter by style" do
    visit "/products?style=classic"
    expect(page).to have_content "Womens classic trainers"
    expect(page).not_to have_content "Womens high top trainers"
    expect(page).not_to have_content "Mens high top trainers"
  end

  scenario "filter by colour" do
    visit "/products?colour=white"
    expect(page).not_to have_content "Womens classic trainers"
    expect(page).not_to have_content "Womens high top trainers"
    expect(page).to have_content "Mens high top trainers"
  end

  scenario "filter by category, style and colour" do
    visit "/products?category=womens&style=high+top&colour=black"
    expect(page).not_to have_content "Womens classic trainers"
    expect(page).to have_content "Womens high top trainers"
    expect(page).not_to have_content "Mens high top trainers"
  end

end
