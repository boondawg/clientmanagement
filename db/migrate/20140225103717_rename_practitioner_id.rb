class RenamePractitionerId < ActiveRecord::Migration
  def change
    rename_column :consultations, :practitioners_id, :practitioner_id
    rename_column :consultations, :consultation_types_id, :consultation_type_id
  end
end
