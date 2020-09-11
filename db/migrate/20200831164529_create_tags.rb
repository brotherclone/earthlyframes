class CreateTags < ActiveRecord::Migration[5.2]

    def self.up
      create_table :tags do |t|
        t.string :uuid
        t.boolean :is_claimed
        t.timestamps
      end
      add_reference :tags, :user, index: true
      add_reference :tags, :log, index: true
    end

    def self.down
      remove_reference :tags, :user
      remove_reference :tags, :log
      drop_table :tags
    end
  end


