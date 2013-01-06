class AddHiddenColumnToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :hidden, :boolean, :default => false
  end
end
