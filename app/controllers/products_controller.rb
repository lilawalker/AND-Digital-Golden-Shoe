class ProductsController < ApplicationController

  def index
    @categories = Product.pluck(:category).uniq
    @styles = Product.pluck(:style).uniq
    @colours = Product.pluck(:colour).uniq
    @products = Product.by_category_style_and_colour(params[:category], params[:style], params[:colour])
  end

  def show
    @product = Product.find(params[:id])
    @variations = Product.where(name: @product.name)
  end

end
