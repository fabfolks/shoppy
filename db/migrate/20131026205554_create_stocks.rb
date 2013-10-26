class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :uuid
      t.string :sku_code
      t.string :sku_description
      t.string :batch_no
      t.datetime :manufactured_data
      t.datetime :expiry_date
      t.integer :quantity
      t.string :unit_of_measure

      t.timestamps
    end
  end
end
