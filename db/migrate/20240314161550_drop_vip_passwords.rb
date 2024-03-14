class DropVipPasswords < ActiveRecord::Migration[7.1]
  def change
    drop_table :vip_passwords
  end
end
