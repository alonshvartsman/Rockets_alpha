class CreateSpaceships < ActiveRecord::Migration[5.2]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.integer :cost
      t.string :launch_site
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
