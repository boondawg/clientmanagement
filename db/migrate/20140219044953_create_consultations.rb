class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.datetime :date
      t.references :client, index: true
      t.references :practitioners, index: true
      t.references :consultation_types, index: true

      t.timestamps
    end
  end
end
