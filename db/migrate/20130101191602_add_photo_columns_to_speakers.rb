class AddPhotoColumnsToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :photo_file_name, :string
    add_column :speakers, :photo_content_type, :string
    add_column :speakers, :photo_file_size, :integer
    add_column :speakers, :photo_file_updated_at, :datetime
  end
end
