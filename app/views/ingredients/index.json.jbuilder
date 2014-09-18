json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :title, :average_price
  json.url ingredient_url(ingredient, format: :json)
end
