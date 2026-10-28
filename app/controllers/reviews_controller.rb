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
      analyzer = ReviewAnalyzerService.new(@review.ratings, @review.review)
      result = analyzer.analyze
      @review.update!(sentiment: result[:sentiment], analysis: result[:analysis]) if result

      product_analysis = analyzer.analyze_product(@product.name, @product.reviews.reload)
      @product.update!(analysis: product_analysis) if product_analysis.present?

      notice = if result && product_analysis.present?
        "Review was successfully created and analyzed."
      else
        "Review was successfully created, but analysis was unavailable."
      end
      redirect_to @product, notice: notice
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :ratings)
  end
end
