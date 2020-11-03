require 'rails_helper'

RSpec.describe BasketItemsController, type: :controller do

  let(:unit) { FactoryBot.create(:unit) }
  let(:basket_item) { FactoryBot.create(:basket_item) }

  describe 'POST /' do

    context 'success' do
      it 'responds with 302' do
        post :create, params: { unit_id: unit.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(unit.product))
      end
    end

    context 'fail' do
      it 'renders product page if item not added' do
        allow_any_instance_of(BasketItem).to receive(:save).and_return(false)
        post :create, params: { unit_id: unit.id }
        expect(response).to redirect_to(product_path(unit.product))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'responds with 200' do
      delete :destroy, params: { id: basket_item.id }
      expect(response).to redirect_to(basket_path)
    end
  end
end
