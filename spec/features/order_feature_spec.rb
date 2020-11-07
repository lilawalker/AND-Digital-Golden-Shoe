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
end
