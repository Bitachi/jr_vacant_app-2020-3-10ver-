class RemoveStatusFromNotification < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :status, :string
  end
end
