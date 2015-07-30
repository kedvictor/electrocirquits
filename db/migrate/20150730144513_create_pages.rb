class CreatePages < ActiveRecord::Migration
  
  def change
    create_table :pages do |t|
      t.text :html
      t.string :mnemo
      t.boolean :permanent, default: false
      t.timestamps null: false
    end
  end
  
end
