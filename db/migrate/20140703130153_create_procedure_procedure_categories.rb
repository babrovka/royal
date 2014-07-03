class CreateProcedureProcedureCategories < ActiveRecord::Migration
  def change
    create_table :procedure_procedure_categories do |t|
      t.integer :procedure_id
      t.integer :procedure_category_id

      t.timestamps
    end
  end
end
