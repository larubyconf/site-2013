class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string   :caption
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.integer  :sort_index, :default => 0
      t.timestamps
    end
  end
end
