class AddStylesheetToTemplates < ActiveRecord::Migration[5.0]
  def change
    add_column :templates, :stylesheet, :string
  end
end
