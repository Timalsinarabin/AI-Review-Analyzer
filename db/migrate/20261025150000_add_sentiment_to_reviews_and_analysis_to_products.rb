class AddSentimentToReviewsAndAnalysisToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :reviews, :sentiment, :string
    add_column :products, :analysis, :text
  end
end
