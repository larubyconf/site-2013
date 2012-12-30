class AddColumnsPresentedAtDurationToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :presented_at, :datetime
    add_column :proposals, :duration, :integer
  end
end
