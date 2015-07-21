class CreateBalls < ActiveRecord::Migration
  
  def change
    create_table :balls do |t|
      t.integer :student_id, null: false
      t.integer :examination_id, null: false
      t.decimal :value, precision: 6, scale: 1, default: nil
      t.string :note
      
      t.timestamps null: false
    end
  end
  
  def unchange
    drop_table :balls
  end
  
end
