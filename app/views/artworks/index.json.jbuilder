json.array!(@artworks) do |artwork|
  json.extract! artwork, :id, :name, :content_type, :collection_boolean, :description
  json.url artwork_url(artwork, format: :json)
end
