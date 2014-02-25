class UpdateConsultationDateNames < ActiveRecord::Migration
  def change
    rename_column :consultations, :date, :start_date_time
    add_column :consultations, :end_date_time, :datetime
  end
end
