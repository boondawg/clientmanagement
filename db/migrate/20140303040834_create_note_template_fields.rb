class CreateNoteTemplateFields < ActiveRecord::Migration
  def change
    create_table :note_template_fields do |t|
      t.references :note_template, index: true
      t.integer :order
      t.string :name
      t.string :type
      t.string :defaultValue

      t.timestamps
    end
  end
end
