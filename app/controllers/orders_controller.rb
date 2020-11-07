class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.build(
      shipped_date: Time.now + 2.days,
      delivered_date: Time.now + 4.days,
      subtotal: @basket.subtotal,
      total: @basket.total,
      status: 'Order placed'
    )

    respond_to do |format|
      if @basket.validate_stock && @order.save

        @basket.basket_items.each do |basket_item|
          @order.order_items.create!(
            unit_id: basket_item.unit_id,
            quantity: basket_item.quantity
          )
        end

        format.html { redirect_to order_path(@order), notice: 'Order placed' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to basket_path, notice: 'Some items were out of stock and have been removed from your basket' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

end
