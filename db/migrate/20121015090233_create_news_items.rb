class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :headline
      t.text :body
      t.datetime :display_date
      t.datetime :expire_date
      t.integer :user_id

      t.timestamps
    end
  end
end
