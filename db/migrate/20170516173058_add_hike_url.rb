class AddHikeUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :url, :string
  end
end
