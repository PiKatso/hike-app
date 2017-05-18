class AddImgSrc < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :img_src, :string
  end
end
