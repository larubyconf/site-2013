class AddTwitterHandleToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :twitter_handle, :string
  end
end
