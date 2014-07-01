class CreateRemoveProductIdFromSubstages < ActiveRecord::Migration
  def change
    remove_column :substages, :product_id
  end
end
