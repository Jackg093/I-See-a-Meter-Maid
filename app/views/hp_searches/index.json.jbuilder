json.array!(@hp_searches) do |hp_search|
  json.extract! hp_search, :id, :name, :zipcode
  json.url hp_search_url(hp_search, format: :json)
end
