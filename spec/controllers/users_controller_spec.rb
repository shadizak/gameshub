require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { User.create!(first_name: 'demo', last_name: 'account', email: "demo@example.com", password: '123456', password_confirmation: '123456') }

    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq user
        expect(response).to be_ok
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to root' do
        get :show, params: { id: user.id }
        # if user is not loged in it should redirect to root path
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
