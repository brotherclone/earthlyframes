class PromptsWork < ActiveRecord::Migration[5.2]

  def self.up
    add_column :prompts, :encounter_type, :integer
    add_column :prompts, :prompt_title, :string
    add_column :prompts, :damage, :integer
  end

  def self.down
    remove_column :prompts, :encounter_type
    remove_column :prompts, :prompt_title
    remove_column :prompts, :damage
  end

end
