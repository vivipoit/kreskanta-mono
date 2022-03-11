class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.references :coin, null: false, foreign_key: true
      t.string :currency, default: 'USD'
      t.decimal :price, precision: 15, scale: 5, default: 0.0
      t.decimal :price_change, default: 0.0
      t.decimal :change_percentage, precision: 5, scale: 2, default: 0.0
      t.integer :change_direction, limit: 1, default: 0

      t.timestamps
    end
  end
end
