class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :origin, :presence => true

  scope :most_recent, -> { order(created_at: :desc).limit(3) }

  scope :most_reviewed, -> {(
    select("products.name, products.cost, products.origin, products.id, products.created_at, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    )}
end
