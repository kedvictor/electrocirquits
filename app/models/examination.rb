
class Examination < ActiveRecord::Base
  
  belongs_to :group
  has_many :balls
  
  validates :title, presence: true
  validates :max_value, presence: true
  validates :group_id, presence: true
  
end
