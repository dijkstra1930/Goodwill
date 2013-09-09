json.array!(@products) do |product|
  json.extract! product, :product_name, :product_price, :product_description
  json.url product_url(product, format: :json)
end
