class AddFieldsToNoteTemplate < ActiveRecord::Migration
  def change
    add_column :note_templates, :current, :boolean
    remove_column :note_templates, :section
  end
end
