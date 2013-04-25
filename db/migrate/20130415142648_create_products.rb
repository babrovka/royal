class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :packing
      t.text :text
      t.text :ingredients
      t.integer :brand_id
      
      t.boolean :visible_professional, :default => false
      t.boolean :visible_dealer1, :default => false
      t.boolean :visible_dealer2, :default => false
      t.boolean :visible_dealer3, :default => false
      
      t.decimal :price_professional, :precision => 8, :scale => 2
      t.decimal :price_dealer1, :precision => 8, :scale => 2
      t.decimal :price_dealer2, :precision => 8, :scale => 2
      t.decimal :price_dealer3, :precision => 8, :scale => 2
      
      t.timestamps
    end
  end
end

