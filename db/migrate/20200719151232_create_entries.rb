class CreateEntries < ActiveRecord::Migration[5.2]
  def self.up
    create_table :entries do |t|
      t.string :entry_text
      t.timestamps
    end

    add_reference :entry, :log, index: true
    add_reference :entry, :prompt, index: true
    add_reference :entry, :character, index: true

  end

  def self.down
    drop_table :entries
  end

end
