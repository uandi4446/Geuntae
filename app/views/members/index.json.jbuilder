json.array!(@members) do |member|
  json.extract! member, :id, :enum, :name, :birthday, :position, :departement, :created_at, :updated_at
  json.url member_url(member, format: :json)
end
