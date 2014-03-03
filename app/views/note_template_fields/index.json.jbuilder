json.array!(@note_template_fields) do |note_template_field|
  json.extract! note_template_field, :id, :note_template_id, :order, :name, :type, :defaultValue
  json.url note_template_field_url(note_template_field, format: :json)
end
