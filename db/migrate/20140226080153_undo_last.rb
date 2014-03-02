class UndoLast < ActiveRecord::Migration
  def change
    change_column :consultations, :start_date_time, :datetime
    change_column :consultations, :end_date_time, :datetime
  end
end
