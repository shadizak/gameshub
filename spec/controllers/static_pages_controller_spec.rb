require 'rails_helper'

describe StaticPagesController, type: :controller do


  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #about' do
    it 'renders the about template' do
      get :about
      expect(response).to be_ok
      expect(response).to render_template('about')
    end
  end

  context 'GET #featured' do
    it 'renders the featured template' do
      get :featured
      expect(response).to be_ok
      expect(response).to render_template('featured')
    end
  end


  context 'POST #thank_you' do
    it 'renders the thank_you template' do
      post 'thank_you', params: {name: 'visitor', email: 'visitor@example.com', message: 'this is a new contact form'}
      expect(response).to render_template('thank_you')
    end
  end
end
