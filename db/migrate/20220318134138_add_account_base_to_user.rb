class AddAccountBaseToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_base, :integer, limit: 1, default: 0
  end
end
