class RenameFriendshipTableToFriendTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :friendships, :friends
  end
end
