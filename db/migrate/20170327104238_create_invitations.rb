class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.string :og_title
      t.text :og_description
      t.string :groom_name
      t.string :bride_name
      t.text :groom_bio
      t.text :bride_bio
      t.string :location
      t.datetime :date
      t.text :wedding_description
      t.boolean :rsvp
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
