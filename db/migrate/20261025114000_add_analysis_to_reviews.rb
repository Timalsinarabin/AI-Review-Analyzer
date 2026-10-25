class AddAnalysisToReviews < ActiveRecord::Migration[8.1]
  def change
    add_column :reviews, :analysis, :text
  end
end
