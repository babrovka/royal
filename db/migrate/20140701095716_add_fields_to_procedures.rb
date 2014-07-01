class AddFieldsToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :short_text, :text
    add_attachment :procedures, :image
  end
end
