require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :origin }
  it { should have_many :reviews }

  describe '#most_recent' do
    it "should return the 3 most recent products" do
      4.times do
        Product.create(name: "somename", cost: 5, origin: "someplace")
      end
      recent_products = Product.most_recent
      expect(recent_products.length).to eq 3
    end
  end

  describe '#most_reviewed' do
    it "should return the product with the most reviews" do
      Product.create(name: "somename", cost: 5, origin: "someplace")
      product = Product.create(name: "coolest product", cost: 5, origin: "someplace")
      4.times do
        product.reviews.create(author: "someguy", content: "somestuff", rating: 3)
      end
      popular_product = Product.most_reviewed
      expect(popular_product[0].name).to eq product.name
    end
  end
end
