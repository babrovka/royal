class AddSeoUrlToTaxons < ActiveRecord::Migration
  def change
    add_column :taxons, :seo_url, :string
  end
end
