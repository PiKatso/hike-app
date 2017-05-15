class FeaturesHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :features_hikes do |t|
      t.column :features_id, :integer
      t.column :hike_id, :integer

      t.timestamps
    end
  end
end
