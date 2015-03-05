json.array!(@markers) do |marker|
  json.extract! marker, :id, :lat, :long
  json.url location_url(marker, format: :json)
end
