class AddSlugToTaxanomies < ActiveRecord::Migration
  def change
    add_column :taxonomies, :slug, :string
    add_index :taxonomies, :slug, unique: true
  end
end
