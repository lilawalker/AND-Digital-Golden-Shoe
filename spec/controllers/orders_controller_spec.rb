require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  login_user
  let(:user) { User.first }
  let(:basket_item) { FactoryBot.create(:basket_item) }

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    context 'success' do
      it 'responds with 302' do
        post(:create, session: {basket_uuid: basket_item.basket.uuid})
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(order_path(id: user.orders.last.id))
      end
    end

    context 'fail' do
      it 'renders basket page if order not processed' do
        allow_any_instance_of(Order).to receive(:save).and_return(false)
        post :create
        expect(response).to redirect_to(basket_path)
      end
    end
  end

  describe 'GET #show' do
    it 'renders the show page' do
      post(:create, session: {basket_uuid: basket_item.basket.uuid})
      get :show, params: { id: user.orders.last.id }
      expect(response).to have_http_status(200)
    end
  end
end
