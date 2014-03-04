json.array!(@note_templates) do |note_template|
  json.extract! note_template, :id
  json.url note_template_url(note_template, format: :json)
end
