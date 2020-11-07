class ApplicationController < ActionController::Base
  before_action :set_basket

  private

  def set_basket
    @basket = Basket.find_by!(uuid: session[:basket_uuid])
  rescue ActiveRecord::RecordNotFound
    @basket = Basket.create(uuid: SecureRandom.uuid)
    session[:basket_uuid] = @basket.uuid
  end

  def after_sign_out_path_for(_)
    root_path
  end

end
