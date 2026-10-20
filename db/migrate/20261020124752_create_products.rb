class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :productname
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.integer :ratings
      t.text :productreview
      t.timestamps
    end
  end
end
