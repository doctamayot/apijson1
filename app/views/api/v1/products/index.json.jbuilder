json.array! @products do |product|
  json.(product, :id, :name, :price, :created_at, :updated_at)
end