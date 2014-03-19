class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :title
      t.string :address
      t.integer :city_id

      t.timestamps
    end
  end
end
