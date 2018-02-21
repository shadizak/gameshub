require 'rails_helper'

describe ProductsController, type: :controller do
  # let(:user){ User.create!(first_name: 'demo', last_name: 'account', email: "demo@example.com", password: '123456', password_confirmation: '123456') }
  # let(:product) {Product.create!(name: 'PES 18', description: 'Stunning football/sport game brought to you by Konami', image_url: 'PES18.jpg', category: 'Sport/Football', price: 39.9)}


  describe 'GET #index' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      sign_in @user
    end

    context 'when products are created' do
      it 'renders  index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #show' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      sign_in @user
    end

    context 'when a product is created' do
      it 'renders show template' do
        get :show, params: { id: @product.id}
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end
  end

  describe 'GET #new' do
    before do
      @user_admin = FactoryBot.create(:admin)
      @product = FactoryBot.create(:product)
      sign_in @user_admin
    end
    context 'when add new product' do
      it 'renders new template' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    before do
      @product = FactoryBot.create(:product)
      @user_admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end
    context "When the user is admin" do
      before do
        sign_in @user_admin
      end
      it "renders the edit template" do
        get :edit, params: {id: @product.id}
        expect(response).to be_ok
        expect(response).to render_template("edit")
      end
    end
    context "When user is not admin and logged in" do
      before do
        sign_in @user
      end
      it "redirects to root path" do
        get :edit, params: {id: @product.id}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
    context "When a user is not admin and not logged in" do
      it "redirects to root path" do
        get :edit, params: {id: @product.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when a new product created' do
      before do
        @user_admin = FactoryBot.create(:admin)
        @user = FactoryBot.create(:user)
        @product = FactoryBot.create(:product)
        sign_in @user_admin
      end
      it 'new product with its valid details will be stored' do
        post :create, params:{product: {id: @product.id ,name: @product.name, description: @product.description, image_url: @product.image_url, category: @product.category, price: @product.price}}
        expect(assigns(:product)).to be_a(Product)
      end

      it "is a valid product" do
        @product = FactoryBot.build(:product)
        expect(@product).to be_valid
      end
      it "is an invalid product, name is missing" do
        @product = FactoryBot.build(:product, name: "")
        expect(@product).not_to be_valid
      end
      it "is an invalid product, price is missing" do
        @product = FactoryBot.build(:product, price: "")
        expect(@product).not_to be_valid
      end
    end
  end

  describe 'PUT/PATCH #update' do
    before do
      @product = FactoryBot.create(:product)
    end
    it "updates product's name" do
      @user_admin = FactoryBot.create(:admin)
      sign_in @user_admin
      @update = { id: @product_id, name: @product.name, category: @product.category, description: @product.description, image_url: @product.image_url,  price: @product.price }
      put :update, params: {id: @product.id, product: @update}
      @product.reload
      expect(@product.name).to eq @product.name
    end
  end

  describe 'DELETE #destroy' do
    it "delete product" do
      @product = FactoryBot.create(:product)
      @user_admin = FactoryBot.create(:admin)
      sign_in @user_admin
      delete :destroy, params: {id: @product.id}
      expect(response).to redirect_to products_path
    end
  end
end
