class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :district
      t.text :street_address
      t.integer :pincode
      t.integer :user_id

      t.timestamps
    end
  end
end
