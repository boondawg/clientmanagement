class UpdateDobToDateOfBirth < ActiveRecord::Migration
  def change
    rename_column :clients, :dob, :date_of_birth
  end
end
