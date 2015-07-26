
class Speciality < ActiveRecord::Base
  
  has_many :groups
  
  validates :title, presence: true
  validates :short_title, presence: true
  
end

