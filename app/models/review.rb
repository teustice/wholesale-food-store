class Review < ActiveRecord::Base
  belongs_to :product
  validates :author, :presence => true
  validates :content, :presence => true, length: {minimum: 2, maximum: 250}
  validates :rating, :presence => true
end
