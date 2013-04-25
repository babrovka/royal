class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.text :question
      t.text :answer
      t.integer :brand_id
      t.integer :case_id
      t.boolean :check, :default => false
      
      t.timestamps
    end
  end
end
