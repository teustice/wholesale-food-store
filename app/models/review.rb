class Review < ActiveRecord::Base
  validates :author, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true
end
