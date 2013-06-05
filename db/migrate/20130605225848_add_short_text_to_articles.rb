class AddShortTextToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :short_text, :text
  end
end
