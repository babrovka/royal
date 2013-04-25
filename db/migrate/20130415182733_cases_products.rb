class CasesProducts < ActiveRecord::Migration
  def change
    create_table :cases_products do |t|
      t.integer :case_id
      t.integer :product_id
    end
  end
end
