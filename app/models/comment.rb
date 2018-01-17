class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # model validation, validation for relations and associations we use :user not user_id
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # comment paginator
  self.per_page = 5
  scope :recent_comments, -> {order(created_at: :desc)}
  scope :rating_desc, -> {order(rating: :desc)}
  scope :rating_asc, -> {order(:rating)}
end
