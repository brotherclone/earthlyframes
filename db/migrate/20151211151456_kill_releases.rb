class KillReleases < ActiveRecord::Migration
  def change
    drop_table :releases
  end
end
