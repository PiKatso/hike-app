class CreateLandmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :landmarks do |t|
      t.column :name, :string
      t.column :description, :string

      t.timestamps
    end
  end
end
