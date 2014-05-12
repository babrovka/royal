class AddFieldsToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :website, :string
    add_column :partners, :phone, :string
  end
end
