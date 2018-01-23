require 'rails_helper'

describe OrdersController, type: :controller do
  # let(:user){ User.create!(first_name: 'demo', last_name: 'account', email: "demo@example.com", password: '123456', password_confirmation: '123456') }
  # let(:product) {Product.create!(name: 'PES 18', description: 'Stunning football/sport game brought to you by Konami', image_url: 'PES18.jpg', category: 'Sport/Football', price: 39.9)}
  # let(:order) {Order.create!(user_id: user.id, product_id: product.id, total: product.price)}

  before do
    @order = FactoryBot.create(:order)
    sign_in @order.user
  end


  describe 'GET #index' do
    context 'when orders created' do
      it 'loads products list in index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    context 'when a order is created' do
      it 'loads order details in show template' do
        get :show, params: { id: @order.id}
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end
  end

end
