class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string    :title
      t.text      :abstract
      t.string    :target_audience
      t.datetime  :submitted_at
      t.string    :status
      t.integer   :user_id
      t.boolean   :removed, :default => false
      t.timestamps
    end
  end
end
