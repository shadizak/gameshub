class StaticPagesController < ApplicationController
  def index
    @products = Product.limit(5)
    products_with_image_url = @products.where.not('products.image_url' => nil).count
    @indicators =  (0...products_with_image_url)
  end

  def featured
    @featured_product = Product.first
  end
end
