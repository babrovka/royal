class AddPositionToStages < ActiveRecord::Migration
  def change
    add_column :stages, :position, :integer, default: 0
    add_column :substages, :position, :integer, default: 0
  end
end
