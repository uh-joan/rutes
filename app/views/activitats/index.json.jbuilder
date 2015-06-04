json.array!(@activitats) do |activitat|
  json.extract! activitat, :id, :titol, :subtitol, :descripcio, :puesto, :lat, :long, :user_id, :cover, :small_cover
  json.url activitat_url(activitat, format: :json)
end
