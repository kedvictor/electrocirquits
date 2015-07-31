
class Student < ActiveRecord::Base
  
  belongs_to :group
  has_many :balls
  
  default_scope { order('full_name') }
  
end
