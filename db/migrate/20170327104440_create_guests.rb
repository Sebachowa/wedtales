class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.integer :plus
      t.references :invitation, foreign_key: true

      t.timestamps
    end
  end
end
