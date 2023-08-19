class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.timestamps
    end
    add_reference :friendships, :user, foreign_key: true
    add_reference :friendships, :friend, foreign_key: { to_table: :users }
  end
end
