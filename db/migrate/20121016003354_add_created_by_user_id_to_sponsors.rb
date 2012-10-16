class AddCreatedByUserIdToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :created_by_user_id, :integer
    add_column :sponsors, :updated_by_user_id, :integer
  end
end
