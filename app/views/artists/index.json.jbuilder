json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :content_type, :collection_boolean, :description
  json.url artist_url(artist, format: :json)
end
