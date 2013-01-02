class CreateSpeakerUrls < ActiveRecord::Migration
  def change
    create_table :speaker_urls do |t|
      t.string :name
      t.string :url
      t.integer :speaker_id

      t.timestamps
    end
  end
end
