class AddSessionTokenToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :session_token, :string, :unique => true, :null => false, :default => ""
  end
end
