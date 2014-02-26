class RenamePractitionerId < ActiveRecord::Migration
  def change
=begin
   rename_column :consultations, :practitioners_id, :practitioner_id
    rename_column :consultations, :consultation_types_id, :consultation_type_id
=end
  end
end
