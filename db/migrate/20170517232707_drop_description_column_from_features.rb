class DropDescriptionColumnFromFeatures < ActiveRecord::Migration[5.1]
  def change
    remove_column :features, :description
  end
end
