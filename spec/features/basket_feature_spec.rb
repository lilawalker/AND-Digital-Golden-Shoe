require 'rails_helper'

RSpec.feature 'Basket', type: :feature do

  let (:unit) { FactoryBot.create(:unit) }

  scenario "adds the product to the basket" do
    visit "/products/#{unit.product.id}?size=6"
    click_button "Add to basket"
    expect(page).to have_content "Added to basket"
  end

end
