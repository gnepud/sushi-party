class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.string :image
      t.string :price
      t.integer :menu_type_id
      t.timestamps
    end
    add_index :menus, :menu_type_id
  end

  def self.down
    drop_table :menus
  end
end
