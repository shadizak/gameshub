class Product < ApplicationRecord
  has_many :orders

  def self.search(search_term)
    if Rails.env.development? || Rails.env.test?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end

  def self.dynamic_indicator
    Product.where.not('products.image_url' => nil).count
  end
end
