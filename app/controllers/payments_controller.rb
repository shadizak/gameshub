class PaymentsController < ApplicationController
  before_action :authenticate_user!
  require 'stripe'
  # payment token submitted with other data to this action.
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # (begin-rescue) block for exception handling
    begin
      charge = Stripe::Charge.create(
        amount:  (@product.price * 100).to_i,
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
        :receipt_email => @user.email
      )
      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
        flash[:notice] = "Happy Gaming with #{@product.name}"
        UserMailer.payment_confirmation(@user, @product).deliver_now
      end
    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product), notice: "#{@product.name} has been purchased successfully!"
  end
end
