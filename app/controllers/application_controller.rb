class ApplicationController < ActionController::Base
  before_action :set_basket

  private

  def set_basket
    @basket = Basket.find_by_uuid!(session[:basket_uuid])
  rescue ActiveRecord::RecordNotFound
    @basket = Basket.create(uuid: SecureRandom.uuid)
    session[:basket_uuid] = @basket.uuid
  end

end
