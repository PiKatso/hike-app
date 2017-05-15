class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.column :rating_num, :integer
      t.column :description, :string
    end
  end
end
