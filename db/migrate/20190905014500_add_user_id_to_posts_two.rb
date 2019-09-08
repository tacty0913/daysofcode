class AddUserIdToPostsTwo < ActiveRecord::Migration[6.0]
  def up
    add_reference :posts, :user, null: true, index: true
  end
  
  def down
    remove_reference :posts, :user, index: true
  end
end
