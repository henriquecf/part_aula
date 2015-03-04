json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :date, :grade_id
  json.url meeting_url(meeting, format: :json)
end
