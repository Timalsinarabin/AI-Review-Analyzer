class UpdateProducts < ActiveRecord::Migration[8.1]
  def change
    rename_column :products, :productname, :name if column_exists?(:products, :productname)
    add_column :products, :description, :text unless column_exists?(:products, :description)
    remove_column :products, :quantity, :integer if column_exists?(:products, :quantity)
    remove_column :products, :ratings, :integer if column_exists?(:products, :ratings)
    remove_column :products, :productreview, :text if column_exists?(:products, :productreview)
  end
end
