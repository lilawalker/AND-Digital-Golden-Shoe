class ApplicationController < ActionController::Base
  before_action :set_basket

  private

  def set_basket
    @basket = Basket.find(session[:basket_id])
  rescue ActiveRecord::RecordNotFound
    @basket = Basket.create(uuid: SecureRandom.uuid)
    session[:basket_id] = @basket.uuid
  end

end
