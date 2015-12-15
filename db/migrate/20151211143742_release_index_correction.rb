class ReleaseIndexCorrection < ActiveRecord::Migration
  def change
    remove_reference :releases, :albums
    add_reference :releases, :album, index:true
  end
end
