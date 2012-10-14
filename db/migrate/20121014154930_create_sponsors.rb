class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string   :name
      t.string   :level
      t.datetime :sponsored_at
      t.integer  :primary_contact_id
      t.text     :message
      t.string   :logo_file_name
      t.string   :logo_content_type
      t.integer  :logo_file_size
      t.datetime :logo_updated_at
      t.text     :note

      t.timestamps
    end
  end
end
