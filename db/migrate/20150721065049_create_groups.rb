class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :year, null: false
      t.integer :speciality_id, null: false
      t.boolean :active, default: false 
      
      t.timestamps null: false
    end
  end
  
  def unchange
    drop_table :groups
  end
  
end
