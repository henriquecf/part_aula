json.array!(@people) do |person|
  json.extract! person, :id, :name, :date_of_birth, :email, :phone
  json.url person_url(person, format: :json)
end
