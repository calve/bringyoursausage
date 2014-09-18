json.array!(@barbecues) do |barbecue|
  json.extract! barbecue, :id, :title, :begin_date
  json.url barbecue_url(barbecue, format: :json)
end
