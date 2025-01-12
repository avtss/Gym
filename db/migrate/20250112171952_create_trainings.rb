class CreateTrainings < ActiveRecord::Migration[8.0]
  def change
    create_table :trainings do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.datetime :training_date
      t.integer :duration_minutes
      t.string :training_type
      t.string :status

      t.timestamps
    end
  end
end
