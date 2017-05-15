class AddElevationAndDistance < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :distance, :string
    add_column :hikes, :elevation, :string
  end
end
