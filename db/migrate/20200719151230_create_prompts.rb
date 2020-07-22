class CreatePrompts < ActiveRecord::Migration[5.2]
  def self.up
    create_table :prompts do |t|
      t.string :prompt_text
      t.string :prompt_image
      t.timestamps
    end
    add_reference :prompts, :song,  index:true
  end

  def self.down
    remove_reference :prompts, :song
    drop_table :prompts
  end
end
