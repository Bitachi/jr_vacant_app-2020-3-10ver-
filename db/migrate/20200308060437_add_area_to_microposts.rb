class AddAreaToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :area, :string
  end
end
