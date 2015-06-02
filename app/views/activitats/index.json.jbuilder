json.array!(@activitats) do |activitat|
  json.extract! activitat, :id, :titol, :subtitol, :descripcio, :lat, :long, :user_id, :cover
  json.url activitat_url(activitat, format: :json)
end
