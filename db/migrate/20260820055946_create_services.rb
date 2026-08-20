class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price_cents, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
