class AddLanguageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :html, :integer, null: false, default: 0
    add_column :posts, :css, :integer, null: false, default: 0
    add_column :posts, :javascript, :integer, null: false, default: 0
    add_column :posts, :jquery, :integer, null: false, default: 0
    add_column :posts, :ruby, :integer, null: false, default: 0
    add_column :posts, :rails, :integer, null: false, default: 0
    add_column :posts, :php, :integer, null: false, default: 0
    add_column :posts, :java, :integer, null: false, default: 0
    add_column :posts, :go, :integer, null: false, default: 0
    add_column :posts, :python, :integer, null: false, default: 0
    add_column :posts, :swift, :integer, null: false, default: 0
  end
end
