class StaticPagesController < ApplicationController
  def featured
    @featured_product = Product.first
  end
end
