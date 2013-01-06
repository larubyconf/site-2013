class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.integer :speaker_id
      t.integer :workshop_id

      t.timestamps
    end
  end
end
