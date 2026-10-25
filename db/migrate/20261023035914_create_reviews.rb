class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.text :review
      t.decimal :ratings, precision: 3, scale: 1

      t.timestamps
    end
  end
end
