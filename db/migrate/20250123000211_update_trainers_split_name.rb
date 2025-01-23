class UpdateTrainersSplitName < ActiveRecord::Migration[8.0]
  def change
    change_table :trainers do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.remove :name
    end
  end
end