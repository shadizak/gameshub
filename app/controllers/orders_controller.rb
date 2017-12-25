class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @orders = Order.includes(:product, :user).where(user_id: current_user.id).all
  end
  def new
  end
  def show
    @order = Order.find(params[:id])
  end
  def create
  end
  def destroy
  end

end
