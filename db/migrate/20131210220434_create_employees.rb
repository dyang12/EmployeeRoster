class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :manager_id
      t.string :name, :null => false
      t.string :email, :null => false, :unique => true
      t.string :phone_number, :null => false, :unique => true
      t.boolean :admin, :default => false
      
      t.timestamps
    end
  end
end
