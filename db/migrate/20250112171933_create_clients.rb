class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :membership_type
      t.date :membership_start_date
      t.date :membership_end_date

      t.timestamps
    end
  end
end
