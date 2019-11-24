class AddPhotoToSpaceships < ActiveRecord::Migration[5.2]
  def change
    add_column :spaceships, :photo, :string
  end
end
