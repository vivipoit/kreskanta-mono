class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :own_symbol, null: false
      t.string :usd_symbol
      t.string :name

      t.timestamps
    end

    add_index :coins, :own_symbol, unique: true
  end
end
