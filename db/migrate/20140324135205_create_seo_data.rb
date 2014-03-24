class CreateSeoData < ActiveRecord::Migration
  def change
    create_table :seo_data do |t|
      t.string :title
      t.text :description
      t.text :seo_text
      t.string :page

      t.timestamps
    end
  end
end
