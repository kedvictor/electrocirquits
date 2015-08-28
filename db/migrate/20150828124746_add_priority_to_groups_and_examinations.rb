class AddPriorityToGroupsAndExaminations < ActiveRecord::Migration
  
  def change
    add_column :groups, :priority, :integer, default: 0
    add_column :examinations, :priority, :integer, default: 0
  end
  
  def unchange
    remove_column :groups, :priority
    remove_column :examinations
  end
  
end
