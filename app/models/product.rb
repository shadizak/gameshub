class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  # model validation
  validates :name, presence: true
  validates :description, length: { minimum: 20 }
  validates :category, presence: true
  validates :image_url, format: {with: /\.(png|jpg|jpeg)\Z/i}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  # define scope for fetching products that have images
  scope :products_with_images, -> {where.not(image_url: nil)}
  # merge scope that is defined in comment model 'recent_comments scope'
  scope :review_recent_comments, -> {joins(:comments).merge(Comment.recent_comments)}


  def self.search(search_term)
    # sqllite and postgres are excute search query differently, sqllite uses 'LIKE', postgres uses 'ilike'
    query_env = Rails.env.production? ? 'ilike' : 'LIKE'
    Product.where("name #{query_env} ?", "%#{search_term}%")
  end

  def self.dynamic_indicator
    products_with_images.count
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def views
    $redis.get("product:#{id}") unless Rails.env.production?# this is equivalent to 'GET product:1'
  end


  def viewed!
    $redis.incr("product:#{id}") unless Rails.env.production?# this is equivalent to 'INC product:1'
  end
end
