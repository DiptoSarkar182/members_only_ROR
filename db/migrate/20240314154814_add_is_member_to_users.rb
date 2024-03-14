class AddIsMemberToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_member, :boolean, default: false
  end
end
