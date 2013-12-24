class RenameManufaturedDataToManufacturedDateInStocks < ActiveRecord::Migration
  def change
    rename_column :stocks, :manufactured_data, :manufactured_date
  end
end
