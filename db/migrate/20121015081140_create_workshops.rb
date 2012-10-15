class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.datetime :presented_at
      t.text :abstract

      t.timestamps
    end
  end
end
