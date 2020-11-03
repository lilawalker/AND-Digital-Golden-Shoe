require 'rails_helper'

RSpec.feature 'Basket', type: :feature do

  let(:unit) { FactoryBot.create(:unit) }

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
    page.find(:css, 'a[href="/basket"]').click
    expect(page).to have_content "#{unit.product.name}"
    expect(page).to have_content "Size: 6"
    expect(page).to have_content "Quantity: 2"
  end

  scenario "displays the basket subtotal" do
    visit "/products/#{unit.product.id}?size=6"
    click_button "Add to basket"
    page.find(:css, 'a[href="/basket"]').click
    expect(page).to have_content "Subtotal: £158.00"
  end

  scenario "removes the product from the basket" do
    page.find(:css, 'a[href="/basket"]').click
    click_link "Remove Item"
    expect(page).to have_content "Removed from basket"
  end

  scenario "disables the 'add to basket' button if the item is out of stock" do
    current_unit = Unit.create(
      serial_number: "MC12HN",
      size: 6,
      quantity: 0,
      product: FactoryBot.create(:product),
    )

    visit "/products/#{current_unit.product.id}?size=6"
    expect(page).not_to have_button("add-to-basket")
  end

end
