FactoryBot.define do
  factory :order do
    subtotal { 1.5 }
    total { 1.5 }
    status { 'Order placed' }
    shipped_date { "2020-11-05 22:47:08" }
    delivered_date { "2020-11-05 22:47:08" }
    user { create(:user) }
  end
end
