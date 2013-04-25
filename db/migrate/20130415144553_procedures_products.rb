class ProceduresProducts < ActiveRecord::Migration
  def change
    create_table :procedures_products do |t|
      t.integer :procedure_id
      t.integer :product_id
    end
  end
end
