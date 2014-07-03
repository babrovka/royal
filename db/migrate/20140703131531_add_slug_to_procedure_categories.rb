class AddSlugToProcedureCategories < ActiveRecord::Migration
  def change
    add_column :procedure_categories, :slug, :string
    add_index :procedure_categories, :slug, unique: true
  end
end
