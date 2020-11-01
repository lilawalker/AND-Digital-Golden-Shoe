json.extract! basket, :id, :uuid, :subtotal, :discount, :total, :created_at, :updated_at
json.url basket_url(basket, format: :json)
