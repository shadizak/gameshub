require 'rails_helper'

describe ProductsController, type: :controller do
  # let(:user){ User.create!(first_name: 'demo', last_name: 'account', email: "demo@example.com", password: '123456', password_confirmation: '123456') }
  # let(:product) {Product.create!(name: 'PES 18', description: 'Stunning football/sport game brought to you by Konami', image_url: 'PES18.jpg', category: 'Sport/Football', price: 39.9)}

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    sign_in @user
  end


  describe 'GET #index' do
    context 'when products created' do
      it 'loads products list in index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    context 'when a product is created' do
      it 'loads product details in show template' do
        get :show, params: { id: @product.id}
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end
  end

  describe 'POST #create' do
    context 'when a new product created' do
      it 'new product with its valid details will be stored' do
        post :create, params:{product: {id: @product.id ,name: @product.name, description: @product.description, image_url: @product.image_url, category: @product.category, price: @product.price}}
        expect(assigns(:product)).to be_a(Product)
      end
    end
  end


end
