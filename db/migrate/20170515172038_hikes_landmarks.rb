class HikesLandmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :hikes_landmarks do |t|
      t.column :hike_id, :integer
      t.column :landmark_id, :integer

      t.timestamps
    end
  end
end
