class ConsultationsProducts < ActiveRecord::Migration
  def change
    create_table :consultations_products do |t|
      t.integer :consultation_id
      t.integer :product_id
    end
  end
end
