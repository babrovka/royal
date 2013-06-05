class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :title
      t.integer :brand_id

      t.timestamps
    end
  end
end
