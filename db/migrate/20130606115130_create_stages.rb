class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :title
      t.integer :procedure_id

      t.timestamps
    end
  end
end
