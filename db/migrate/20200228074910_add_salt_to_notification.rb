class AddSaltToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :status, :string
  end
end
