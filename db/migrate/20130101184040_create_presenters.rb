class CreatePresenters < ActiveRecord::Migration
  def change
    create_table :presenters do |t|
      t.integer :proposal_id
      t.integer :speaker_id

      t.timestamps
    end
  end
end
