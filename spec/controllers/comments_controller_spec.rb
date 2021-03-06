require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user){ User.create!(first_name: 'demo', last_name: 'account', email: "demo@example.com", password: '123456', password_confirmation: '123456') }
  let(:product) {Product.create!(name: 'PES 18', description: 'Stunning football/sport game brought to you by Konami', image_url: 'PES18.jpg', category: 'Sport/Football', price: 39.9)}
  let(:comment) {Comment.create!(user_id: user.id, product_id: product.id, body: 'this is comment', rating: 4)}


  before do
    sign_in user
  end

end
