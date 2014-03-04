class CreateNoteFields < ActiveRecord::Migration
  def change
    create_table :note_fields do |t|
      t.references :note, index: true
      t.references :note_template_field, index: true
      t.string :value

      t.timestamps
    end
  end
end
