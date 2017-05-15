class CreateHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :hikes do |t|
      t.column :name, :string
      t.column :latitude, :string
      t.column :longitude, :string
      t.column :description, :string
      t.column :rating_id, :integer
      t.column :region_id, :integer

      t.timestamps
    end
  end
end
