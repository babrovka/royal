class AddRegionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region_id, :integer
    add_column :users, :region, :string
  end
end
