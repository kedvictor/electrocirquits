
class Ball < ActiveRecord::Base
  
  belongs_to :student
  belongs_to :examination
  
  
end
