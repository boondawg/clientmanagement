class ChangeDateTimeToTime < ActiveRecord::Migration
  def change
    change_column :consultations, :start_date_time, :time
    change_column :consultations, :end_date_time, :time
  end
end
