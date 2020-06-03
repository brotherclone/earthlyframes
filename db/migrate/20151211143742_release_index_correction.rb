class ReleaseIndexCorrection < ActiveRecord::Migration[5.2]
  def change
    remove_reference :releases, :albums
    add_reference :releases, :album, index:true
  end
end
