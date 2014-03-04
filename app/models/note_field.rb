class NoteField < ActiveRecord::Base
  belongs_to :note
  belongs_to :note_template_field
end
