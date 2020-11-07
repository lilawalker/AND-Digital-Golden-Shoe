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

  context "logged in" do
    before do
      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      visit "/products/#{unit.product.id}?size=6"
      click_button "Add to basket"
      page.find(:css, 'a[href="/basket"]').click
      click_button "Checkout"
    end

    scenario "order can be checked out and confirmed if signed in" do
      expect(page).to have_content "Order placed"
      expect(page).to have_content "Order Number: #{user.orders.first.id}"
    end

    scenario "basket is empty after checkout" do
      page.find(:css, 'a[href="/basket"]').click
      expect(page).to have_content "Your basket is empty"
    end

    scenario "can view previous orders" do
      click_link "My Account"
      expect(page).to have_content "Order number: #{user.orders.first.id}"
    end

    scenario "can see full order line detail" do
      click_link "My Account"
      page.find(:css, "a[href='/order/#{user.orders.first.id}']").click
      expect(page).to have_content "#{user.orders.last.order_items.last.unit.product.name}"
    end
  end
end
