class ChangeWorkSchedulesTimeFields < ActiveRecord::Migration[8.0]
  def change
    change_column :work_schedules, :start_time, :time
    change_column :work_schedules, :end_time, :time
  end
end