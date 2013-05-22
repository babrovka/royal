class AddCheckToUsers < ActiveRecord::Migration
  def change
    add_column :users, :check, :boolean
  end
end
