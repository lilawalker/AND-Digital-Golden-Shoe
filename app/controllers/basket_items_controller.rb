class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: [:show, :edit, :update, :destroy]

  def new
    @basket_item = BasketItem.new
  end

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

  private

    def set_basket_item
      @basket_item = BasketItem.find(params[:id])
    end

    def basket_item_params
      params.require(:basket_item).permit(:unit_id)
    end

end
