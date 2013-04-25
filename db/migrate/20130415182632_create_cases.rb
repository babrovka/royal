class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
