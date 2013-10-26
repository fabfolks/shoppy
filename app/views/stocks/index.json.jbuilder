json.array!(@stocks) do |stock|
  json.extract! stock, :uuid, :sku_code, :sku_description, :batch_no, :manufactured_data, :expiry_date, :quantity, :unit_of_measure
  json.url stock_url(stock, format: :json)
end
