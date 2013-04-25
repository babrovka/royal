class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
