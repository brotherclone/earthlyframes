class ReservedNamesInCols < ActiveRecord::Migration[5.2]
  def up
    rename_column :shows, :when, :showdate
    rename_column :releases, :format, :formatname
  end
  def down
    rename_column :releases, :formatname, :format
    rename_column :shows, :showdate, :when
  end
end
