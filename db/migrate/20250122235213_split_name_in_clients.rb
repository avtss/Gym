class SplitNameInClients < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :middle_name, :string
    remove_column :clients, :name, :string
  end
end