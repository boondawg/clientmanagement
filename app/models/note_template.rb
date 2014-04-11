class NoteTemplate < ActiveRecord::Base
  has_many :note_template_fields
  has_many :notes

  accepts_nested_attributes_for :note_template_fields, allow_destroy: true
end
