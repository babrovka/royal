class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :seo_title, :string
    add_column :products, :seo_description, :text
    add_column :products, :seo_text, :text
  end
end
