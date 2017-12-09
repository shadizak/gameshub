class Product < ApplicationRecord
  has_many :orders

  # define scope for fetching products that have images
  scope :products_with_images, -> {where.not(image_url: nil)}

  def self.search(search_term)
    # sqllite and postgres are excute search query differently, sqllite uses 'LIKE', postgres uses 'ilike'
    query_env = Rails.env.production? ? 'ilike' : 'LIKE'
    Product.where("name #{query_env} ?", "%#{search_term}%")

  end

  def self.dynamic_indicator
    products_with_images.count
  end
end
