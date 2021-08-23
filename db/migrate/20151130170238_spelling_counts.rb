class SpellingCounts < ActiveRecord::Migration[5.2]
  def change
    rename_column :releases, :relasedate, :releasedate
  end
end
