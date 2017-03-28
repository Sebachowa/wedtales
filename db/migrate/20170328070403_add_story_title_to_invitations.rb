class AddStoryTitleToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :story_title, :string
  end
end
