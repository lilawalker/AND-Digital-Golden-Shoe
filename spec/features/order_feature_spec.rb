require 'rails_helper'

RSpec.feature 'Order', type: :feature do

  let(:unit) { FactoryBot.create(:unit) }
  let(:user) { FactoryBot.create(:user) }

  scenario "cannot checkout if basket is empty" do
    visit '/'
    page.find(:css, 'a[href="/basket"]').click
    expect(page).not_to have_button "Checkout"
    expect(page).to have_content "Your basket is empty"
  end

  scenario "user must be logged in to checkout" do
    visit "/products/#{unit.product.id}?size=6"
    click_button "Add to basket"
    page.find(:css, 'a[href="/basket"]').click
    click_link 'Checkout'
    expect(page).to have_button "Log in"
  end
end
