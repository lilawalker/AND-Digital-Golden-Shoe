class ProductsController < ApplicationController

  def index
    @categories = Product.distinct.pluck(:category)
    @styles = Product.distinct.pluck(:style)
    @colours = Product.distinct.pluck(:colour)
    @products = Product.filter_by_property(params[:category], params[:style], params[:colour])
  end

  def show
    @product = Product.find(params[:id])
    @variations = Product.where(name: @product.name)
    @sizes = @product.units.pluck(:size)
    @selected_size = params[:size] ? @product.units.find_by(size: params[:size]) : @product.units.first
  end

end
