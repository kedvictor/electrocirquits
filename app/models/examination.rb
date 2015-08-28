
class Examination < ActiveRecord::Base
  
  belongs_to :group
  has_many :balls
  
  validates :title, presence: true
  validates :max_value, presence: true
  validates :group_id, presence: true
  
  default_scope { order('priority DESC') }
  
  def popup_title
    result = self.title
    result << " | #{self.date.strftime('%d.%m.%Y')}" if self.date
    result << " | #{self.max_value} балів" if self.max_value
    result
  end
  
end
