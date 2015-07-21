class CreateVariables < ActiveRecord::Migration
  
  def change
    create_table :variables do |t|
      t.string :key
      t.string :value
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
  
  def unchange
    drop_table :variables
  end
  
end
