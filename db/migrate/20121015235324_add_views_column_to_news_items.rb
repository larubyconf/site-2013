class AddViewsColumnToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :views, :integer, :default => 0
  end
end
