class CreateNotes < ActiveRecord::Migration
  
  def change
    create_table :notes do |t|
      t.text :text
      t.boolean :active
      t.integer :priority, default: 0
      t.timestamps null: false
    end
  end
  
end
