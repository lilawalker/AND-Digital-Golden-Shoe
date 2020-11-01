require 'rails_helper'

RSpec.feature 'Basket', type: :feature do

  let (:unit) { FactoryBot.create(:unit) }

  before do
    visit "/products/#{unit.product.id}?size=6"
    click_button "Add to basket"
  end

  scenario "adds the product to the basket" do
    expect(page).to have_content "Added to basket"
  end

  scenario "view the items in the basket" do
    visit "/products/#{unit.product.id}?size=6"
    click_button "Add to basket"
    click_link "See Basket"
    expect(page).to have_content "#{unit.product.name}"
    expect(page).to have_content "6"
    expect(page).to have_content "2"
  end

  scenario "displays the basket subtotal" do
    visit "/products/#{unit.product.id}?size=6"
    click_button "Add to basket"
    click_link "See Basket"
    expect(page).to have_content "Subtotal: 158"
  end

  scenario "removes the product from the basket" do
    click_link "See Basket"
    click_link "Remove Item"
    expect(page).to have_content "Removed from basket"
  end

end
