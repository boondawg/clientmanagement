class PractitionerFixNames < ActiveRecord::Migration
  def change
    rename_column :practitioners, :name, :first_name
    add_column :practitioners, :last_name, :string
  end
end
