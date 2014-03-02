class CreateNoteTemplates < ActiveRecord::Migration
  def change
    create_table :note_templates do |t|
      t.string :name
      t.string :section

      t.timestamps
    end
  end
end
