
class Group < ActiveRecord::Base
  
  belongs_to :speciality
  has_many :students
  has_many :examinations
  has_many :active_examinations, -> { where active: true }, class_name: 'Examination'
  has_many :inactive_examinations, -> { where active: false }, class_name: 'Examination'
  has_many :active_students, -> { where active: true }, class_name: 'Student'
  has_many :inactive_students, -> { where active: false }, class_name: 'Student'
  
  validates :title, presence: true
  validates :year, presence: true
  validates :speciality_id, presence: true
  
  default_scope { order('priority DESC') }
  scope :all_active, -> { where(active: true) }

end
