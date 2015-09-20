json.array!(@time_data) do |time_datum|
  json.extract! time_datum, :id, :enum
  json.url time_datum_url(time_datum, format: :json)
end
