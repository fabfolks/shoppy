class AddUserIdToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :user_id, :int
  end
end
