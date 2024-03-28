class RenameGmailNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :gmail_name, :name
  end
end
