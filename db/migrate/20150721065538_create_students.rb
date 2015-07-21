class CreateStudents < ActiveRecord::Migration
  
  def change
    create_table :students do |t|
      t.string :full_name, null: false
      t.integer :group_id, null: false
      t.string :note
      t.boolean :active, default: true
      
      t.timestamps null: false
    end
  end
  
  def unchange
    drop_table :students
  end
  
end
