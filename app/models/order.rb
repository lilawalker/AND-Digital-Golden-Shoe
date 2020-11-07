class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :order_items
  validates :subtotal, :total, :status, :user_id, presence: true
end
