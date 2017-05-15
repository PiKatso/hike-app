class CreateHikeRatingsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :hike_ratings do |t|
      t.column :hike_id, :integer
      t.column :rating_id, :integer
      t.column :description, :varchar
    end
  end
end
