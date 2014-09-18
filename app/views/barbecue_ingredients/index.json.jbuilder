json.array!(@barbecue_ingredients) do |barbecue_ingredient|
  json.extract! barbecue_ingredient, :id
  json.url barbecue_ingredient_url(barbecue_ingredient, format: :json)
end
