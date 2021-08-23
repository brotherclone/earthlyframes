class TextToString < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :format, :string

  end
end
