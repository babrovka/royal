class AddFieldsToCases < ActiveRecord::Migration
  def change
    add_column :cases, :short_description, :text
    add_attachment :cases, :image
  end
end
