class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :recent_comments, -> {order(created_at: :desc)}
  scope :rating_desc, -> {order(rating: :desc)}
  scope :rating_asc, -> {order(:rating)}
end
