class AddBrandIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :brand_id, :integer
  end
end
