class AddFieldsToTaxons < ActiveRecord::Migration
  def change
    add_column :taxons, :seo_title, :string
    add_column :taxons, :seo_description, :text
    add_column :taxons, :seo_text, :text
  end
end
