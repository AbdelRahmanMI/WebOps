class RenameFieldsInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_name, :name
  end
end
