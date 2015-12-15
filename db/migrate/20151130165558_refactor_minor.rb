class RefactorMinor < ActiveRecord::Migration
  def change
    change_column :releases, :relasedate, :datetime
    add_column :shows, :flyer, :string
  end
end
