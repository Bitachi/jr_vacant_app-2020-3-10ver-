class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :email
      t.string :token
      t.string :month
      t.string :day
      t.string :train
      t.string :dep_stn
      t.string :arr_stn
      t.string :hour
      t.string :minute

      t.timestamps
    end
  end
end
