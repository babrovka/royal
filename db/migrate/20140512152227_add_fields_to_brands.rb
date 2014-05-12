class AddFieldsToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :partner_id, :integer
  end
end
