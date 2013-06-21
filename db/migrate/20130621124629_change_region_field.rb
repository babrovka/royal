class ChangeRegionField < ActiveRecord::Migration
  def up
    remove_column :users, :region
    add_column :users, :own_region, :string
  end

  def down
    remove_column :users, :own_region
    add_column :users, :region, :string
  end
end
