class AddTaxonIDtoProducts < ActiveRecord::Migration
  def change
    add_column :products, :taxon_id, :integer
  end
end
