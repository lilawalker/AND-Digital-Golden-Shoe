class ProductsController < ApplicationController

  def index
    @categories = Product.pluck(:category).uniq

    if params.has_key?("category")
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @variations = Product.where(name: @product.name)
  end

end
