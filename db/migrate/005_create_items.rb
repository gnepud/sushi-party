class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :price
      t.integer :carte_id
      t.timestamps
    end

    add_index :items, :carte_id
  end

  def self.down
    drop_table :items
  end
end
