class RemoveOrphanedMixTables < ActiveRecord::Migration[8.1]
  def up
    drop_table :mix_embeds, if_exists: true
    drop_table :mix_reviews, if_exists: true
    drop_table :mixes, if_exists: true
    drop_table :reviewers, if_exists: true
  end

  def down
    create_table :reviewers do |t|
      t.string :name
      t.string :email
      t.string :token
      t.timestamps
    end
    add_index :reviewers, :email, unique: true
    add_index :reviewers, :token, unique: true

    create_table :mixes do |t|
      t.string :title
      t.integer :rainbow_table
      t.timestamps
      t.bigint :song_id
    end
    add_index :mixes, :song_id

    create_table :mix_reviews do |t|
      t.boolean :favored
      t.string :comment
      t.timestamps
      t.bigint :mix_id
      t.bigint :reviewer_id
    end
    add_index :mix_reviews, :mix_id
    add_index :mix_reviews, :reviewer_id

    create_table :mix_embeds do |t|
      t.string :version
      t.timestamps
      t.bigint :mix_id
      t.bigint :embed_id
    end
    add_index :mix_embeds, :mix_id
    add_index :mix_embeds, :embed_id
  end
end
