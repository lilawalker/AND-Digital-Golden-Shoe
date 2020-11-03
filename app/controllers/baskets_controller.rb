class BasketsController < ApplicationController
  before_action :subtotal_price, only: [:show]

  def show
  end

  private

  def subtotal_price
    subtotal = @basket.basket_items.sum { |item| item.subtotal_price }
    @basket.update_column(:subtotal, subtotal)
  end

end
