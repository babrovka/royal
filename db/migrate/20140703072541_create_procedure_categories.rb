class CreateProcedureCategories < ActiveRecord::Migration
  def change
    create_table :procedure_categories do |t|
      t.string :title
      t.integer :brand_id

      t.timestamps
    end
  end
end
