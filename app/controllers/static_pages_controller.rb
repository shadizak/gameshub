class StaticPagesController < ApplicationController
  def index
    @products = Product.limit(5)
  end

  def featured
    @featured_product = Product.first
  end
end
