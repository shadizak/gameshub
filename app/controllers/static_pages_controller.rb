class StaticPagesController < ApplicationController
  def index
    @products = Product.limit(5)
    dynamic_indicator
  end

  def featured
    @featured_product = Product.first
  end

  def dynamic_indicator
    products_with_image_url = @products.where.not('products.image_url' => nil).count
    @indicators =  (0...products_with_image_url)
  end
end
