class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :assignment, :boolean
    add_column :users, :company, :string
    add_column :users, :address, :string
    add_column :users, :work_phone, :string
    add_column :users, :fax, :string
    add_column :users, :work_email, :string
    add_column :users, :from, :string
    add_column :users, :comment, :text
    add_column :users, :education, :boolean
  end
end
