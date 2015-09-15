class ForgotShows < ActiveRecord::Migration
  def change
    add_column :shows, :title, :string
    add_column :shows, :description, :text
    add_column :shows, :date, :datetime
    add_column :shows, :location, :string
  end
end
