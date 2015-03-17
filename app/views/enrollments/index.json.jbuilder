json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :role, :grade_id
  json.url enrollment_url(enrollment, format: :json)
end
