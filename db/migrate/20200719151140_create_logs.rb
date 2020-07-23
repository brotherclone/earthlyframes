class CreateLogs < ActiveRecord::Migration[5.2]
  def self.up
    create_table :logs do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end

end
