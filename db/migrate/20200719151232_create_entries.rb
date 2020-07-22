class CreateEntries < ActiveRecord::Migration[5.2]
  def self.up
    create_table :entries do |t|
      t.string :entry_text
      t.timestamps
    end

    add_reference :entries, :log, index: true
    add_reference :entries, :prompt, index: true
    add_reference :entries, :character, index: true

  end

  def self.down
    remove_reference :entries, :log
    remove_reference :entries, :prompt
    remove_reference :entries, :character
    drop_table :entries
  end

end
