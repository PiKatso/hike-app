class RemoveHikeRatingsTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :hikes, :rating_id
    add_column :hikes, :difficulty, :string
    drop_table :ratings
    drop_table :hike_ratings
  end
end
