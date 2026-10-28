class DashboardController < ApplicationController
  def index
    @total_reviews = Review.count
    @total_positive_reviews = Review.where(sentiment: "positive").count
    @total_mixed_reviews = Review.where(sentiment: "mixed").count
    @total_negative_reviews = Review.where(sentiment: "negative").count
    @total_products = Product.count
  end
end
