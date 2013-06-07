class CreateSubstages < ActiveRecord::Migration
  def change
    create_table :substages do |t|
      t.text :text
      t.integer :product_id
      t.integer :stage_id

      t.timestamps
    end
  end
end
