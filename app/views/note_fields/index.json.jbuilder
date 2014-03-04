json.array!(@note_fields) do |note_field|
  json.extract! note_field, :id, :[note_id, :note_template_field_id, :value
  json.url note_field_url(note_field, format: :json)
end
