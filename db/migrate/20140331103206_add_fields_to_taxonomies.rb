class AddFieldsToTaxonomies < ActiveRecord::Migration
  def change
    add_column :taxonomies, :seo_title, :string
    add_column :taxonomies, :seo_description, :text
    add_column :taxonomies, :seo_text, :text
  end
end
