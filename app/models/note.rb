class Note < ActiveRecord::Base

  validates :text, presence: true

  default_scope { order('priority DESC') }

end
