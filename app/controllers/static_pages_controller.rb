class StaticPagesController < ApplicationController
  def index
    @products = Product.limit(4)
    # call dynamic_indicator method in product model that fetch products with images from db. equivalent to (products_with_image_url = Product.limit(5).where.not('products.image_url' => nil).count)
    products_with_image_url = @products.dynamic_indicator
    @indicators =  (0...products_with_image_url)
  end

  def featured
    @featured_product = Product.first
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
