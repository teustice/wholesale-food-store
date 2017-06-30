class LandingController < ApplicationController
  def index
    @recent_products = Product.most_recent
    # index of 0, incase there are matching review counts
    @most_reviewed = Product.most_reviewed[0]
  end
end
