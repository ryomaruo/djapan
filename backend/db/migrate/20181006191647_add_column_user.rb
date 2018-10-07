class AddColumnUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :provider, :string, after: :password
    add_column :users, :uid, :string, after: :provider
  end

  def down
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
  end
end
