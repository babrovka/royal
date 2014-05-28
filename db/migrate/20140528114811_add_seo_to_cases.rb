class AddSeoToCases < ActiveRecord::Migration
  def change
    add_column :cases, :seo_url, :string
    add_column :cases, :seo_title, :string
    add_column :cases, :seo_description, :text
  end
end
