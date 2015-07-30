class Page < ActiveRecord::Base
  
  def self.add_page page, mnemo, permanent
    page_attributes = { html: page, mnemo: mnemo, permanent: permanent }
    last_page = self.last || self.create
    if last_page.permanent
      self.create page_attributes
    else
      last_page.update_attributes page_attributes
    end
  end
  
end
