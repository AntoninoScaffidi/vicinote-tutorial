class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :service, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.integer :price_cents, null: false
      t.string :status, null: false, default: "pending"
      t.date :scheduled_on, null: false

      t.timestamps
    end
  end
end
