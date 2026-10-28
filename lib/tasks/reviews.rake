namespace :reviews do
  desc "Analyze existing reviews and generate product summaries"
  task analyze_existing: :environment do
    analyzer = ReviewAnalyzerService
    reviews = Review.where(sentiment: nil).or(Review.where(analysis: nil))

    puts "Analyzing #{reviews.count} reviews..."
    reviews.find_each do |review|
      result = analyzer.new(review.ratings, review.review).analyze
      abort "Could not analyze review ##{review.id}. Check the Unsloth server and logs." unless result

      review.update!(sentiment: result[:sentiment], analysis: result[:analysis])
      puts "Analyzed review ##{review.id}: #{result[:sentiment]}"
    end

    products = Product.joins(:reviews).distinct
    puts "Generating summaries for #{products.count} products..."
    products.find_each do |product|
      analysis = analyzer.new.analyze_product(product.name, product.reviews.order(:id))
      abort "Could not analyze product ##{product.id}. Check the Unsloth server and logs." unless analysis

      product.update!(analysis: analysis)
      puts "Analyzed product ##{product.id}: #{product.name}"
    end

    puts "Existing review and product analysis completed."
  end
end
