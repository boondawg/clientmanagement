class NoteTemplate < ActiveRecord::Base
  has_many :note_template_fields
  has_many :notes
end
