FactoryBot.define do
  factory :basket_item do
    basket { create(:basket) }
    unit { create(:unit) }
    quantity { 1 }
  end
end
