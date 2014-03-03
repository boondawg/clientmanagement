class NoteTemplate < ActiveRecord::Base
  has_many :note_template_fields
end
