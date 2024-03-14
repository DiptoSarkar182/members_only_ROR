class CreateVipPasswordsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :vip_passwords do |t|
      t.string :password

      t.timestamps
    end
  end
end
