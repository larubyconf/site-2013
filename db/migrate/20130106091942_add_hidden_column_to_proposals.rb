class AddHiddenColumnToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :hidden, :boolean, :default => false
  end
end
