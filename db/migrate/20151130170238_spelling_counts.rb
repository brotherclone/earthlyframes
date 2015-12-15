class SpellingCounts < ActiveRecord::Migration
  def change
    rename_column :releases, :relasedate, :releasedate
  end
end
