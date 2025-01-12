class CreateTrainers < ActiveRecord::Migration[8.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :specialization
      t.string :email
      t.string :phone
      t.text :availability_schedule

      t.timestamps
    end
  end
end
