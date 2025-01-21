class RemoveAvailabilityScheduleFromTrainers < ActiveRecord::Migration[8.0]
  def change
    remove_column :trainers, :availability_schedule, :text
  end
end
