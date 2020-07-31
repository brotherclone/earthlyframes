class CreateLogs < ActiveRecord::Migration[5.2]
  def self.up
    create_table :logs do |t|
      t.timestamps
      t.string :title
    end
  end

  def self.down
    drop_table :logs
  end

end
