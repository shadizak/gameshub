class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.includes(:product, :user).all
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
