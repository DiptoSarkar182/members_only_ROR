class AddGmailNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gmail_name, :string
  end
end
