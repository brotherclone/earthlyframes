class PostDate < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_date, :datetime
  end
end
