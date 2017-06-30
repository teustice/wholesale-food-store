require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }
  it { should belong_to :product }

  it "rejects content length ouside the range of 2..250" do
    review = Review.new
    review.content = 'a'
    review.valid?
    review.errors[:content].should include("is too short (minimum is 2 characters)") 
  end
end
