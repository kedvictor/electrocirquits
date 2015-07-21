class CreateSpecialityTable < ActiveRecord::Migration
  
  def change
    create_table :specialities do |t|
      t.string :title
      t.string :short_title
      
      t.timestamps
    end
  end
  
  def unchange
    drop_table :specialities 
  end
  
end
