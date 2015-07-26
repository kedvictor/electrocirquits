
class Group < ActiveRecord::Base
  
  belongs_to :speciality
  has_many :students
  
  validates :title, presence: true
  validates :year, presence: true
  validates :speciality_id, presence: true
  
end
