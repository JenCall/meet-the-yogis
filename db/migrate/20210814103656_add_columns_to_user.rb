class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about_me, :text
    add_column :users, :certification, :boolean
    add_column :users, :style, :string
    add_column :users, :ratings, :integer
    add_column :users, :status, :integer
  end
end
