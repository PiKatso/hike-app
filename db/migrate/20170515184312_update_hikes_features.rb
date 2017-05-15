class UpdateHikesFeatures < ActiveRecord::Migration[5.1]
  def change
    change_table :features_hikes do |t|
      t.integer :feature_id

    end

    remove_column :features_hikes, :features_id
  end
end
