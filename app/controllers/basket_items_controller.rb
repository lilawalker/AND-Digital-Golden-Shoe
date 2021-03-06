class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: [:destroy]

  def create
    @unit = Unit.find(params[:unit_id])
    @basket_item = @basket.add_unit(@unit)

    respond_to do |format|
      if @basket_item.persisted?
        format.html { redirect_to product_path(@basket_item.unit.product), notice: 'Added to basket.' }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { redirect_to product_path(@basket_item.unit.product) }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @basket_item.destroy
    respond_to do |format|
      format.html { redirect_to basket_path, notice: 'Removed from basket.' }
      format.json { head :no_content }
    end
  end

  private

  def set_basket_item
    @basket_item = BasketItem.find(params[:id])
  end

end
