class AddCoordinatesToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :latitude, :float
    add_column :invitations, :longitude, :float
  end
end
