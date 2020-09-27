class CreateConsequences < ActiveRecord::Migration[5.2]
  def self.up
    create_table :consequences do |t|
      t.string :description
      t.string :image_url
      t.integer :condition
      t.timestamps
    end

    add_reference :consequences, :prompt, index: true

  end

  def self.down
    remove_reference :consequences, :prompt
    drop_table :consequences
  end

end
