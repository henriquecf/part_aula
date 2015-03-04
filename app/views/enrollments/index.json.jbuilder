json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :role, :person_id, :grade_id
  json.url enrollment_url(enrollment, format: :json)
end
