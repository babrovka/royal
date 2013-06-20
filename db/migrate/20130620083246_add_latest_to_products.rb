class AddLatestToProducts < ActiveRecord::Migration
  def change
    add_column :products, :latest, :boolean
  end
end
