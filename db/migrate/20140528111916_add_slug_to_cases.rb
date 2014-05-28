class AddSlugToCases < ActiveRecord::Migration
  def change
    add_column :cases, :slug, :string
    add_index :cases, :slug, unique: true
  end
end
