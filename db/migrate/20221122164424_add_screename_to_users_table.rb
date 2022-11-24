class AddScreenameToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :screenname, :string
  end
end
