class TextToString < ActiveRecord::Migration
  def change
    change_column :albums, :format, :string

  end
end
