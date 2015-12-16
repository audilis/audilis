json.array!(@games) do |game|
  json.extract! game, :id, :title, :tagline, :description
  json.url game_url(game, format: :json)
end
