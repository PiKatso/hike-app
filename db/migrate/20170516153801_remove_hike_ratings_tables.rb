class RemoveHikeRatingsTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :hikes, :rating_id
    change_table :hikes do |t|
      t.string :difficulty
    end
    drop_table :ratings
    drop_table :hike_ratings
  end
end
