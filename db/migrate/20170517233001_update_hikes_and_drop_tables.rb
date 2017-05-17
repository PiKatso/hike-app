class UpdateHikesAndDropTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :hikes, :region_id
    add_column :hikes, :region, :string
    drop_table :hikes_landmarks
    drop_table :landmarks
    drop_table :regions
  end
end
