class CreateExaminations < ActiveRecord::Migration
  
  def change
    create_table :examinations do |t|
      t.string :title
      t.string :short_title
      t.string :note
      t.string :mnemo
      t.date :date
      t.integer :group_id, null: false
      t.integer :max_value, null: false
      t.decimal :weight, precision: 4, scale: 2, default: 1.00
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
  
  def unchange
    drop_table :examinations
  end
  
end
