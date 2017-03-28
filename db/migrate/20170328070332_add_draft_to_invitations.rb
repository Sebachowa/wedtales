class AddDraftToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :draft, :boolean, default: true
  end
end
