class NoteTemplate < ActiveRecord::Base
  has_many :note_template_fields, :dependent => :destroy
  has_many :notes

  accepts_nested_attributes_for :note_template_fields, allow_destroy: true
end
