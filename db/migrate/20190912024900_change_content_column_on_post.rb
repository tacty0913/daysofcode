class ChangeContentColumnOnPost < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :content, false
  end
end
