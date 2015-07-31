
class Group < ActiveRecord::Base
  
  belongs_to :speciality
  has_many :students
  has_many :examinations
  
  validates :title, presence: true
  validates :year, presence: true
  validates :speciality_id, presence: true
  
  default_scope { order('title') }
  
end
