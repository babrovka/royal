class CreateSubstageProducts < ActiveRecord::Migration
  def change
    create_table :substage_products do |t|
      t.integer :substage_id
      t.integer :product_id

      t.timestamps
    end
  end
end
