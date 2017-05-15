class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.column :name, :string
      t.column :description, :string

      t.timestamps
    end
  end
end
