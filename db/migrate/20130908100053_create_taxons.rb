class CreateTaxons < ActiveRecord::Migration
  def change
    create_table :taxons do |t|
      t.string :title
      t.integer :taxonomy_id

      t.timestamps
    end
  end
end
