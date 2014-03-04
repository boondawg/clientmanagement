class Note < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :consultation, index: true
      t.references :client, index: true
      t.references :note_template, index: true
      t.timestamps
    end
  end
end
