class AddNestedSetToTaxons < ActiveRecord::Migration
  NESTED_SET_COLUMNS = [:parent_id, :lft, :rgt, :depth]

  def up
    NESTED_SET_COLUMNS.each do |column|
      add_column :taxons, column, :integer
    end

    if defined?(Taxon) && Taxon.respond_to?(:rebuild!)
      Taxon.rebuild!
    end
  end

  def down
    NESTED_SET_COLUMNS.each do |column|
      remove_column :taxons, column
    end
  end
end
