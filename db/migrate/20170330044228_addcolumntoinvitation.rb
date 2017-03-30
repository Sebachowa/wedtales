class Addcolumntoinvitation < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :custom_url, :string
  end
end
