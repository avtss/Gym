class ModifyTrainingsToSeparateDateAndTime < ActiveRecord::Migration[8.0]
  def change
    remove_column :trainings, :training_date, :datetime

    add_column :trainings, :training_date, :date, null: false
    add_column :trainings, :training_time, :time, null: false
  end
end
