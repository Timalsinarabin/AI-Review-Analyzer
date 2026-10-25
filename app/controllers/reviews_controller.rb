class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:product).order(created_at: :desc)
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)

    if @review.save
      redirect_to @product, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :ratings)
  end
end
