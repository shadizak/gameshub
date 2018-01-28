class OrdersController < ApplicationController
  load_and_authorize_resource :order
  before_action :authenticate_user!
  def index
    @orders = Order.includes(:product, :user).where(user_id: current_user.id).all
    byebug
  end
  def new
  end
  def show
    @order = Order.find(params[:id])
  end
  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.build(product: @product)
    @order.user = current_user
    @order.total = @product.price
    if @order.save
      redirect_to order_path(@order)
      flash[:notice] = "Order made successfully!"
    else
      flash[:error] = "Something went wrong!"
    end
  end
  def destroy
  end
end
