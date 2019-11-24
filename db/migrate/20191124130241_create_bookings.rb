class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :date
      t.references :spaceship, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
