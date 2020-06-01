class RefactorMinor < ActiveRecord::Migration[5.2]
  def change
    change_column :releases, :relasedate, :datetime
    add_column :shows, :flyer, :string
  end
end
