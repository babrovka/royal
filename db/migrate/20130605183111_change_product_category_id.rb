class ChangeProductCategoryId < ActiveRecord::Migration
  def up
    remove_column :products, :category_id
    add_column :products, :product_category_id, :integer
  end

  def down
    remove_column :products, :product_category_id
    add_column :products, :category_id, :integer
  end
end
